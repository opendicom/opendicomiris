#import <Foundation/Foundation.h>
#import "DefaultsOsiriX.h"
#import "AppController.h"
#import "DCMPix.h"
#import <WebKit/WebKit.h>
#import "N2Debug.h"
#import <Quartz/Quartz.h>

#undef verify
#include "osconfig.h" /* make sure OS specific configuration is included first */
#include "djdecode.h"  /* for dcmjpeg decoders */
#include "djencode.h"  /* for dcmjpeg encoders */
#include "dcrledrg.h"  /* for DcmRLEDecoderRegistration */
#include "dcrleerg.h"  /* for DcmRLEEncoderRegistration */
#include "djrploss.h"
#include "djrplol.h"
#include "dcpixel.h"
#include "dcrlerp.h"
#include "dcdicdir.h"
#include "dcdatset.h"
#include "dcmetinf.h"
#include "dcfilefo.h"
#include "dcdebug.h"
#include "dcuid.h"
#include "dcdict.h"
#include "dcdeftag.h"
//#include "djdecode.h" //JPEG-LS
//#include "djencode.h" //JPEG-LS

extern "C"
{
	extern short Papy3Init ();


    void exitOsiriX(void)
    {
        [NSException raise: @"JPEG error exception raised" format: @"JPEG error exception raised - See Console.app for error message"];
    }
}

enum DCM_CompressionQuality {DCMLosslessQuality = 0, DCMHighQuality, DCMMediumQuality, DCMLowQuality};

NSLock					*PapyrusLock = 0L;
NSThread				*mainThread = 0L;
BOOL					NEEDTOREBUILD = NO;
NSMutableDictionary		*DATABASECOLUMNS = 0L;
short					Altivec = 0;
short					Use_kdu_IfAvailable = 1;

extern void dcmtkSetJPEGColorSpace( int);

/*
void myunlink(const char * path) {
    NSLog(@"Unlinking %s", path);
    unlink(path);
    NSLog(@"... Unlinked %s", path);
}
*/
#define myunlink unlink

// WHY THIS EXTERNAL APPLICATION FOR COMPRESS OR DECOMPRESSION?

// Because if a file is corrupted, it will not crash the OsiriX application, but only this small task.

// Always modify this function in sync with compressionForModality in Decompress.mm / BrowserController.m
int compressionForModality( NSArray *array, NSArray *arrayLow, int limit, NSString* mod, int* quality, int resolution)
{
	NSArray *s;
	if( resolution < limit)
		s = arrayLow;
	else
		s = array;
	
	if( [mod isEqualToString: @"SR"]) // No compression for DICOM SR
		return compression_none;
	
	for( NSDictionary *dict in s)
	{
		if( [mod rangeOfString: [dict valueForKey: @"modality"]].location != NSNotFound)
		{
			int compression = compression_none;
			if( [[dict valueForKey: @"compression"] intValue] == compression_sameAsDefault)
				dict = [s objectAtIndex: 0];
			
			compression = [[dict valueForKey: @"compression"] intValue];
			
			if( quality)
			{
				if( compression == compression_JPEG2000 || compression == compression_JPEGLS)
					*quality = [[dict valueForKey: @"quality"] intValue];
				else
					*quality = 0;
			}
			
			return compression;
		}
	}
	
	if( [s count] == 0)
		return compression_none;
	
	if( quality)
		*quality = [[[s objectAtIndex: 0] valueForKey: @"quality"] intValue];
	
	return [[[s objectAtIndex: 0] valueForKey: @"compression"] intValue];
}

int main(int argc, const char *argv[])
{
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	// To avoid:
	// http://lists.apple.com/archives/quicktime-api/2007/Aug/msg00008.html
	// _NXCreateWindow: error setting window property (1002)
	// _NXTermWindow: error releasing window (1002)
	[NSApplication sharedApplication];
	
	
	//	argv[ 1] : in path
	//	argv[ 2] : what
	
	if( argv[ 1] && argv[ 2])
	{
		// register global JPEG decompression codecs
		DJDecoderRegistration::registerCodecs();
//        DJLSDecoderRegistration::registerCodecs();
        
		// register global JPEG compression codecs
		DJEncoderRegistration::registerCodecs(
			ECC_lossyRGB,
			EUC_never,
			OFFalse,
			OFFalse,
			0,
			0,
			0,
			OFTrue,
			ESS_444,
			OFFalse,
			OFFalse,
			0,
			0,
			0.0,
			0.0,
			0,
			0,
			0,
			0,
			OFTrue,
			OFTrue,
			OFFalse,
			OFFalse,
			OFTrue);
        
//        DJLSEncoderRegistration::registerCodecs();
        
		// register RLE compression codec
		DcmRLEEncoderRegistration::registerCodecs();

		// register RLE decompression codec
		DcmRLEDecoderRegistration::registerCodecs();
		
		NSString	*path = [NSString stringWithUTF8String:argv[1]];
		NSString	*what = [NSString stringWithUTF8String:argv[2]];
		NSInteger fileListFirstItemIndex = 3;
		
		NSMutableDictionary* dict = [DefaultsOsiriX getDefaults];
		[dict addEntriesFromDictionary: [[NSUserDefaults standardUserDefaults] persistentDomainForName:@"com.rossetantoine.osirix"]];
		
		if ([what isEqualToString:@"SettingsPlist"])
		{
			@try
			{
				[dict addEntriesFromDictionary:[NSMutableDictionary dictionaryWithContentsOfFile:[NSString stringWithUTF8String:argv[fileListFirstItemIndex]]]];
				what = [NSString stringWithUTF8String:argv[4]];
				fileListFirstItemIndex += 2;
			}
			@catch (NSException* e)
			{ // ignore evtl failures
				NSLog(@"Decompress failed reading settings plist at %s: %@", argv[fileListFirstItemIndex], e);
			}
		}
		
		dcmtkSetJPEGColorSpace( [[dict objectForKey:@"UseJPEGColorSpace"] intValue]);
		
//		BOOL useDCMTKForJP2K = [[dict objectForKey:@"useDCMTKForJP2K"] intValue];
		
#pragma mark compress
		if( [what isEqualToString:@"compress"])
		{
			Use_kdu_IfAvailable = [[dict objectForKey:@"UseKDUForJPEG2000"] intValue];
			
			NSArray *compressionSettings = [dict valueForKey: @"CompressionSettings"];
			NSArray *compressionSettingsLowRes = [dict valueForKey: @"CompressionSettingsLowRes"];
			
			int limit = [[dict objectForKey: @"CompressionResolutionLimit"] intValue];
			
			NSString *destDirec;
			if( [path isEqualToString: @"sameAsDestination"])
				destDirec = nil;
			else
				destDirec = path;
			
			int i;
			for( i = fileListFirstItemIndex; i < argc; i++)
			{
				NSString *curFile = [NSString stringWithUTF8String:argv[ i]];
				OFBool status = YES;
				NSString *curFileDest;
				
				if( destDirec)
					curFileDest = [destDirec stringByAppendingPathComponent: [curFile lastPathComponent]];
				else
					curFileDest = [curFile stringByAppendingString: @" temp"];
				
				if( [[curFile pathExtension] isEqualToString: @"zip"] || [[curFile pathExtension] isEqualToString: @"osirixzip"])
				{
                    NSString *tempCurFileDest = [[curFileDest stringByDeletingLastPathComponent] stringByAppendingPathComponent: [NSString stringWithFormat: @".%@", [curFileDest lastPathComponent]]];
                    
                    myunlink([tempCurFileDest fileSystemRepresentation]);
                    myunlink([curFileDest fileSystemRepresentation]);
                    
					NSTask *t = [[[NSTask alloc] init] autorelease];
	
					@try
					{
						[t setLaunchPath: @"/usr/bin/unzip"];
						[t setCurrentDirectoryPath: @"/tmp/"];
						NSArray *args = [NSArray arrayWithObjects: @"-o", @"-d", tempCurFileDest, curFile, nil];
						[t setArguments: args];
						[t launch];
                        
                        while( [t isRunning])
                            [NSThread sleepForTimeInterval: 0.1];
                        
                        //[t waitUntilExit];		// <- This is VERY DANGEROUS : the main runloop is continuing...
					}
					@catch ( NSException *e)
					{
						NSLog( @"***** unzipFile exception: %@", e);
					}
                    
					[[NSFileManager defaultManager] moveItemAtPath: tempCurFileDest toPath: curFileDest error: nil];
                    
                    myunlink([curFile fileSystemRepresentation]);
				}
				else
				{
					DcmFileFormat fileformat;
					OFCondition cond = fileformat.loadFile( [curFile UTF8String]);
					// if we can't read it stop
					if( cond.good())
					{
						DcmDataset *dataset = fileformat.getDataset();
//						DcmItem *metaInfo = fileformat.getMetaInfo();
						DcmXfer original_xfer(dataset->getOriginalXfer());
						
						const char *string = NULL;
						
//						NSString *sopClassUID = nil;
//						if (dataset->findAndGetString(DCM_SOPClassUID, string, OFFalse).good() && string != NULL)
//							sopClassUID = [NSString stringWithCString:string encoding: NSASCIIStringEncoding];
						
                        
						{
                            delete dataset->remove( DcmTagKey( 0x0009, 0x1110)); // "GEIIS" The problematic private group, containing a *always* JPEG compressed PixelData
                            
							NSString *modality;
							if (dataset->findAndGetString(DCM_Modality, string, OFFalse).good() && string != NULL)
								modality = [NSString stringWithCString:string encoding: NSASCIIStringEncoding];
							else
								modality = @"OT";
							
							int resolution = 0;
							unsigned short rows = 0;
							if (dataset->findAndGetUint16( DCM_Rows, rows, OFFalse).good())
							{
								if( resolution == 0 || resolution > rows)
									resolution = rows;
							}
							unsigned short columns = 0;
							if (dataset->findAndGetUint16( DCM_Columns, columns, OFFalse).good())
							{
								if( resolution == 0 || resolution > columns)
									resolution = columns;
							}
							
							int quality, compression = compressionForModality( compressionSettings, compressionSettingsLowRes, limit, modality, &quality, resolution);
							
                            BOOL alreadyCompressed = NO;
                            
                            if (original_xfer.isEncapsulated())
                            {
                                switch( compression)
                                {
                                    case compression_JPEGLS:
                                        if( original_xfer.getXfer() == EXS_JPEGLSLossless || original_xfer.getXfer() == EXS_JPEGLSLossy)
                                            alreadyCompressed = YES;
                                    break;
                                    
                                    case compression_JPEG2000:
                                        if( original_xfer.getXfer() == EXS_JPEG2000 || original_xfer.getXfer() == EXS_JPEG2000LosslessOnly)
                                            alreadyCompressed = YES;
                                    break;
                                    
                                    case compression_JPEG:
                                        if( original_xfer.getXfer() == EXS_JPEGProcess14SV1TransferSyntax)
                                            alreadyCompressed = YES;
                                    break;
                                }
                            }
                            
                            if( alreadyCompressed == NO)
                            {
//                                if( useDCMTKForJP2K == NO && compression == compression_JPEG2000)
//                                {
//                                    [DCMPixelDataAttribute setUse_kdu_IfAvailable: [[dict objectForKey:@"UseKDUForJPEG2000"] intValue]];
//                                    DCMObject *dcmObject = [[DCMObject alloc] initWithContentsOfFile: curFile decodingPixelData: NO];
//                                    
//                                    BOOL succeed = NO;
//                                    
//                                    // See - (BOOL) needToCompressFile: (NSString*) path in BrowserControllerDCMTKCategory for these exceptions
//                                    if( [DCMAbstractSyntaxUID isImageStorage: [dcmObject attributeValueWithName:@"SOPClassUID"]] == YES && [[dcmObject attributeValueWithName:@"SOPClassUID"] isEqualToString:[DCMAbstractSyntaxUID pdfStorageClassUID]] == NO && [DCMAbstractSyntaxUID isStructuredReport: [dcmObject attributeValueWithName:@"SOPClassUID"]] == NO)
//                                    {
//                                        @try
//                                        {
//                                            DCMTransferSyntax *tsx = [DCMTransferSyntax JPEG2000LossyTransferSyntax];
//                                            succeed = [dcmObject writeToFile: curFileDest withTransferSyntax: tsx quality: quality AET:@"OsiriX" atomically:YES];
//                                        }
//                                        @catch (NSException *e)
//                                        {
//                                            NSLog( @"dcmObject writeToFile failed: %@", e);
//                                        }
//                                    }
//                                    else
//                                    {
//                                        succeed = [[NSData dataWithContentsOfFile: curFile] writeToFile: curFileDest atomically: YES];
//                                    }
//                                    
//                                    [dcmObject release];
//                                    
//                                    if( succeed)
//                                    {
//                                        myunlink([curFile fileSystemRepresentation]);
//                                        if( destDirec == nil)
//                                            [[NSFileManager defaultManager] moveItemAtPath: curFileDest toPath: curFile error: nil];
//                                    }
//                                    else
//                                    {
//                                        myunlink([curFileDest fileSystemRepresentation]);
//                                        
//                                        if ([[dict objectForKey: @"DecompressMoveIfFail"] boolValue])
//                                        {
//                                            [[NSFileManager defaultManager] moveItemAtPath: curFile toPath: curFileDest error: nil];
//                                        }
//                                        else if( destDirec)
//                                        {
//                                            myunlink([curFile fileSystemRepresentation]);
//                                            NSLog( @"failed to compress file: %@, the file is deleted", curFile);
//                                        }
//                                        else
//                                            NSLog( @"failed to compress file: %@", curFile);
//                                    }
//                                }
//                                else
                                    if( compression == compression_JPEG || compression == compression_JPEG2000 || compression == compression_JPEGLS)
                                {
                                    DcmRepresentationParameter *params = nil;
                                    E_TransferSyntax tSyntax;
                                    DJ_RPLossless losslessParams(6,0);
                                    DJ_RPLossy JP2KParams( quality);
                                    DJ_RPLossy JP2KParamsLossLess( DCMLosslessQuality);
                                    
                                    if( compression == compression_JPEG)
                                    {
                                        params = &losslessParams;
                                        tSyntax = EXS_JPEGProcess14SV1TransferSyntax;
                                    }
                                    else if( compression == compression_JPEGLS)
                                    {
                                        if( quality == DCMLosslessQuality)
                                        {
                                            params = &JP2KParamsLossLess;
                                            tSyntax = EXS_JPEGLSLossless;
                                        }
                                        else
                                        {
                                            params = &JP2KParams;
                                            tSyntax = EXS_JPEGLSLossy;
                                        }
                                    }
                                    else if( compression == compression_JPEG2000)
                                    {
                                        if( quality == DCMLosslessQuality)
                                        {
                                            params = &JP2KParamsLossLess;
                                            tSyntax = EXS_JPEG2000LosslessOnly;
                                        }
                                        else
                                        {
                                            params = &JP2KParams;
                                            tSyntax = EXS_JPEG2000;
                                        }
                                    }
                                    else
                                    {
                                        params = &JP2KParamsLossLess;
                                        tSyntax = EXS_JPEG2000LosslessOnly;
                                        
                                        NSLog( @" ****** UNKNOW compression Decompress.mm");
                                    }
                                    
                                    // this causes the lossless JPEG version of the dataset to be created
                                    DcmXfer oxferSyn( tSyntax);
                                    dataset->chooseRepresentation(tSyntax, params);
                                    
                                    // check if everything went well
                                    if (dataset->canWriteXfer(tSyntax))
                                    {
                                        // force the meta-header UIDs to be re-generated when storing the file 
                                        // since the UIDs in the data set may have changed 
                                        
                                        //only need to do this for lossy
                                        //delete metaInfo->remove(DCM_MediaStorageSOPClassUID);
                                        //delete metaInfo->remove(DCM_MediaStorageSOPInstanceUID);
                                        
                                        // store in lossless JPEG format
                                        fileformat.loadAllDataIntoMemory();
                                        
                                        {
                                            NSString *tempCurFileDest = [[curFileDest stringByDeletingLastPathComponent] stringByAppendingPathComponent: [NSString stringWithFormat: @".%@", [curFileDest lastPathComponent]]];
                                            
                                            myunlink([tempCurFileDest fileSystemRepresentation]);
                                            myunlink([curFileDest fileSystemRepresentation]);
                                            
                                            cond = fileformat.saveFile( [tempCurFileDest UTF8String], tSyntax);
                                            status =  (cond.good()) ? YES : NO;
                                            
                                            [[NSFileManager defaultManager] moveItemAtPath: tempCurFileDest toPath: curFileDest error: nil];
                                        }
                                        
                                        if( status == NO)
                                        {
                                            myunlink([curFileDest fileSystemRepresentation]);
                                            if ([[dict objectForKey: @"DecompressMoveIfFail"] boolValue])
                                            {
                                                [[NSFileManager defaultManager] moveItemAtPath: curFile toPath: curFileDest error: nil];
                                            }
                                            else if( destDirec)
                                            {
                                                myunlink([curFile fileSystemRepresentation]);
                                                NSLog( @"failed to compress file: %@, the file is deleted", curFile);
                                            }
                                            else
                                                NSLog( @"failed to compress file: %@", curFile);
                                        }
                                        else
                                        {
                                            myunlink([curFile fileSystemRepresentation]);
                                            if( destDirec == nil)
                                                [[NSFileManager defaultManager] moveItemAtPath: curFileDest toPath: curFile error: nil];
                                        }
                                    }
                                }
                                else
                                {
                                    if( destDirec)
                                    {
                                        myunlink([curFileDest fileSystemRepresentation]);
                                        [[NSFileManager defaultManager] moveItemAtPath: curFile toPath: curFileDest error: nil];
                                        myunlink([curFile fileSystemRepresentation]);
                                    }
                                }
                            }
                            else
                            {
                                if( destDirec)
                                {
                                    myunlink([curFileDest fileSystemRepresentation]);
                                    [[NSFileManager defaultManager] moveItemAtPath: curFile toPath: curFileDest error: nil];
                                    myunlink([curFile fileSystemRepresentation]);
                                }
                            }
						}
					}
					else if ([[dict objectForKey: @"DecompressMoveIfFail"] boolValue])
                    {
                        myunlink([curFileDest fileSystemRepresentation]);
                        [[NSFileManager defaultManager] moveItemAtPath: curFile toPath: curFileDest error: nil];
                    }
                    else NSLog( @"compress : cannot read file: %@", curFile);
				}
			}
		}
		
        if( [what isEqualToString: @"testDICOMDIR"])
        {
            NSLog( @"-- Testing DICOMDIR: %@", [NSString stringWithUTF8String: argv[ 1]]);
            
            DcmDicomDir dcmdir( [[NSString stringWithUTF8String: argv[ 1]] fileSystemRepresentation]);
            DcmDirectoryRecord& record = dcmdir.getRootRecord();
            
            for (unsigned int i = 0; i < record.card();)
            {
                DcmElement* element = record.getElement(i);
                OFString ofstr;
                element->getOFStringArray(ofstr).good();
                
                i += 10;
            }
            
            NSLog( @"-- Testing DICOMDIR done");
                  
//            *(long*) 0x00 = 0xDEADBEEF;
        }
        
# pragma mark testFiles
		if( [what isEqualToString: @"testFiles"])
		{
			Papy3Init();
			
			//[DCMPixelDataAttribute setUse_kdu_IfAvailable: [[dict objectForKey:@"UseKDUForJPEG2000"] intValue]];
			
			Use_kdu_IfAvailable = [[dict objectForKey:@"UseKDUForJPEG2000"] intValue];
			
			int i;
			for( i = fileListFirstItemIndex; i < argc ; i++)
			{
				NSString *curFile = [NSString stringWithUTF8String: argv[ i]];
				
				// Simply try to load and generate the image... will it crash?
				
				DCMPix *dcmPix = [[DCMPix alloc] initWithPath: curFile :0 :1 :nil :0 :0 isBonjour: NO imageObj: nil];
				
				if( dcmPix)
				{
					[dcmPix CheckLoad];
					
					//*(long*)0 = 0xDEADBEEF; // Dead Beef ? WTF ??? Will it unlock the matrix....
					
					[dcmPix release];
				}
				else NSLog( @"dcmPix == nil");
			}
		}
		
# pragma mark decompressList
		if( [what isEqualToString:@"decompressList"])
		{
			NSString *destDirec;
			if( [path isEqualToString: @"sameAsDestination"])
				destDirec = nil;
			else
				destDirec = path;
			
			Use_kdu_IfAvailable = [[dict objectForKey:@"UseKDUForJPEG2000"] intValue];
			
			int i;
			for( i = fileListFirstItemIndex; i < argc ; i++)
			{
				NSString *curFile = [NSString stringWithUTF8String:argv[ i]];
				NSString *curFileDest;
				
				if( destDirec)
					curFileDest = [destDirec stringByAppendingPathComponent: [curFile lastPathComponent]];
				else
					curFileDest = [curFile stringByAppendingString: @" temp"];
				
				OFBool status = NO;
				
				if( [[curFile pathExtension] isEqualToString: @"zip"] || [[curFile pathExtension] isEqualToString: @"osirixzip"])
				{
                    NSString *tempCurFileDest = [[curFileDest stringByDeletingLastPathComponent] stringByAppendingPathComponent: [NSString stringWithFormat: @".%@", [curFileDest lastPathComponent]]];
                    
                    myunlink([tempCurFileDest fileSystemRepresentation]);
                    myunlink([curFileDest fileSystemRepresentation]);
                    
					NSTask *t = [[[NSTask alloc] init] autorelease];
	
					@try
					{
						[t setLaunchPath: @"/usr/bin/unzip"];
						[t setCurrentDirectoryPath: @"/tmp/"];
						NSArray *args = [NSArray arrayWithObjects: @"-o", @"-d", tempCurFileDest, curFile, nil];
						[t setArguments: args];
						[t launch];
						while( [t isRunning])
                            [NSThread sleepForTimeInterval: 0.1];
                        
                        //[t waitUntilExit];		// <- This is VERY DANGEROUS : the main runloop is continuing...
					}
					@catch ( NSException *e)
					{
						NSLog( @"***** unzipFile exception: %@", e);
					}
					
                    [[NSFileManager defaultManager] moveItemAtPath: tempCurFileDest toPath: curFileDest error: nil];
                    
                    myunlink([curFile fileSystemRepresentation]);
				}
				else
				{
					OFCondition cond;
					
					const char *fname = (const char *)[curFile UTF8String];
					
					DcmFileFormat fileformat;
					cond = fileformat.loadFile(fname);
					
					if (cond.good())
					{
						DcmXfer filexfer(fileformat.getDataset()->getOriginalXfer());
						
						//hopefully dcmtk willsupport jpeg2000 compression and decompression in the future: November 7th 2010 : I did it !
                  if( filexfer.getXfer() != EXS_LittleEndianExplicit || filexfer.getXfer() != EXS_LittleEndianImplicit)
						{
							DcmDataset *dataset = fileformat.getDataset();
							
                            delete dataset->remove( DcmTagKey( 0x0009, 0x1110)); // "GEIIS" The problematic private group, containing a *always* JPEG compressed PixelData
                            
							// decompress data set if compressed
							dataset->chooseRepresentation(EXS_LittleEndianExplicit, NULL);
							
							// check if everything went well
							if (dataset->canWriteXfer(EXS_LittleEndianExplicit))
							{
								fileformat.loadAllDataIntoMemory();
                                
                                NSString *tempCurFileDest = [[curFileDest stringByDeletingLastPathComponent] stringByAppendingPathComponent: [NSString stringWithFormat: @".%@", [curFileDest lastPathComponent]]];
                                
                                myunlink([tempCurFileDest fileSystemRepresentation]);
                                myunlink([curFileDest fileSystemRepresentation]);
                                
								cond = fileformat.saveFile( [tempCurFileDest UTF8String], EXS_LittleEndianExplicit);
								status =  (cond.good()) ? YES : NO;
                                
                                [[NSFileManager defaultManager] moveItemAtPath: tempCurFileDest toPath: curFileDest error: nil];
							}
							else status = NO;
							
							
							if( status == NO)
							{
                                myunlink([curFileDest fileSystemRepresentation]);
								
								if( destDirec)
								{
                                    myunlink([curFile fileSystemRepresentation]);
									NSLog( @"failed to decompress file: %@, the file is deleted", curFile);
								}
								else
									NSLog( @"failed to decompress file: %@", curFile);
							}
						}
						else
						{
							if( destDirec)
							{
                                myunlink([curFileDest fileSystemRepresentation]);
								[[NSFileManager defaultManager] moveItemAtPath: curFile toPath: curFileDest error: nil];
                                myunlink([curFile fileSystemRepresentation]);
							}
							status = NO;
						}
					}
				}
				
				if( status)
				{
                    myunlink([curFile fileSystemRepresentation]);
					if( destDirec == nil)
						[[NSFileManager defaultManager] moveItemAtPath: curFileDest toPath: curFile error: nil];
				}
			}
		}
		
				
# pragma mark pdfFromURL
		if( [what isEqualToString: @"pdfFromURL"])
		{
			@try
			{
				WebView *webView = [[[WebView alloc] initWithFrame: NSMakeRect(0,0,1,1) frameName: @"myFrame" groupName: @"myGroup"] autorelease];
				NSWindow *w = [[[NSWindow alloc] initWithContentRect:NSMakeRect(0,0,1,1) styleMask:NSBorderlessWindowMask backing:NSBackingStoreNonretained defer:NO] autorelease];
				[w setContentView:webView];
				
				WebPreferences *webPrefs = [WebPreferences standardPreferences];
				
				[webPrefs setLoadsImagesAutomatically: YES];
				[webPrefs setAllowsAnimatedImages: YES];
				[webPrefs setAllowsAnimatedImageLooping: NO];
				[webPrefs setJavaEnabled: NO];
				[webPrefs setPlugInsEnabled: NO];
				[webPrefs setJavaScriptEnabled: YES];
				[webPrefs setJavaScriptCanOpenWindowsAutomatically: NO];
				[webPrefs setShouldPrintBackgrounds: YES];
				
				[webView setApplicationNameForUserAgent: @"OsiriX"];
				[webView setPreferences: webPrefs];
				[webView setMaintainsBackForwardList: NO];
				
				NSURL *theURL = [NSURL fileURLWithPath: path];
				if( theURL)
				{
					NSURLRequest *request = [NSURLRequest requestWithURL: theURL];
					
					[[webView mainFrame] loadRequest: request];
					
					NSTimeInterval timeout = [NSDate timeIntervalSinceReferenceDate] + 10;
					
					while( [[webView mainFrame] dataSource] == nil || [[[webView mainFrame] dataSource] isLoading] == YES || [[[webView mainFrame] provisionalDataSource] isLoading] == YES)
					{
						[[NSRunLoop currentRunLoop] runUntilDate: [NSDate dateWithTimeIntervalSinceNow: 0.1]];
						
						if( [NSDate timeIntervalSinceReferenceDate] > timeout)
							break;
					}
					
					NSPrintInfo *sharedInfo = [NSPrintInfo sharedPrintInfo];
					NSMutableDictionary *sharedDict = [sharedInfo dictionary];
					NSMutableDictionary *printInfoDict = [NSMutableDictionary dictionaryWithDictionary: sharedDict];
					
					[printInfoDict setObject: NSPrintSaveJob forKey: NSPrintJobDisposition];
					
					[[NSFileManager defaultManager] removeItemAtPath: [path stringByAppendingPathExtension: @"pdf"] error: nil];
					[printInfoDict setObject: [path stringByAppendingPathExtension: @"pdf"] forKey: NSPrintSavePath];
					
					NSPrintInfo *printInfo = [[NSPrintInfo alloc] initWithDictionary: printInfoDict];
					
                    [printInfo setBottomMargin: 30];
                    [printInfo setTopMargin: 30];
                    [printInfo setLeftMargin: 24];
                    [printInfo setRightMargin: 24];
                    
					[printInfo setHorizontalPagination: NSAutoPagination];
					[printInfo setVerticalPagination: NSAutoPagination];
					[printInfo setVerticallyCentered:NO];
					
					NSView *viewToPrint = [[[webView mainFrame] frameView] documentView];
					NSPrintOperation *printOp = [NSPrintOperation printOperationWithView: viewToPrint printInfo: printInfo];
					[printOp setShowsPrintPanel: NO];
					[printOp setShowsProgressPanel: NO];
					[printOp runOperation];
                    
                    //jf remove empty last PDF page
                    @try
                    {
                        NSURL *pdfURL = [theURL URLByAppendingPathExtension:@"pdf"];
                        PDFDocument *pdf = [[[PDFDocument alloc]initWithURL:pdfURL]autorelease];
                        NSUInteger pdfPageCount = [pdf pageCount];
                        if (pdfPageCount > 1)
                        {
                            NSUInteger pdfLastPageIndex = pdfPageCount - 1;
                            PDFPage *pdfLastPage = [pdf pageAtIndex:pdfLastPageIndex];
                            NSUInteger pdfLastPageCharCount = [pdfLastPage numberOfCharacters];
                            if (pdfLastPageCharCount < 2)
                            {
                                [pdf removePageAtIndex:pdfLastPageIndex];
                                [pdf writeToURL:pdfURL];
                            }
                        }
                    }
                    @catch ( NSException *e) {
                        N2LogException( e);
                    }
				}
			}
			@catch (NSException * e)
			{
                N2LogExceptionWithStackTrace(e);
			}
			return 0;
		}
		
	    // deregister JPEG codecs
		//DJDecoderRegistration::cleanup();	We dont care: we are just a small app : our memory will be killed by the system. Dont loose time here !
		//DJEncoderRegistration::cleanup();	We dont care: we are just a small app : our memory will be killed by the system. Dont loose time here !

		// deregister RLE codecs
		//DcmRLEDecoderRegistration::cleanup();	We dont care: we are just a small app : our memory will be killed by the system. Dont loose time here !
		//DcmRLEEncoderRegistration::cleanup();	We dont care: we are just a small app : our memory will be killed by the system. Dont loose time here !
	}
	
//	[pool release]; We dont care: we are just a small app : our memory will be killed by the system. Dont loose time here !
	
	return 0;
}

