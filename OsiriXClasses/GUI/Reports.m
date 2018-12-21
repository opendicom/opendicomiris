/*=========================================================================
  Program:   OsiriX

  Copyright (c) OsiriX Team
  All rights reserved.
  Distributed under GNU - LGPL
  
  See http://www.osirix-viewer.com/copyright.html for details.

     This software is distributed WITHOUT ANY WARRANTY; without even
     the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
     PURPOSE.
=========================================================================*/

#import "Reports.h"
#import "DicomFile.h"
#import "OsiriX/DCM.h"
#import "BrowserController.h"
#import "NSString+N2.h"
#import "NSFileManager+N2.h"
#import "NSAppleScript+N2.h"
#import "DicomDatabase.h"
#import "N2Debug.h"

// if you want check point log info, define CHECK to the next line, uncommented:
#define CHECK NSLog(@"Applescript result code = %d", ok);

// This converts an AEDesc into a corresponding NSValue.

//static id aedesc_to_id(AEDesc *desc)
//{
//	OSErr ok;
//
//	if (desc->descriptorType == typeChar)
//	{
//		NSMutableData *outBytes;
//		NSString *txt;
//
//		outBytes = [[NSMutableData alloc] initWithLength:AEGetDescDataSize(desc)];
//		ok = AEGetDescData(desc, [outBytes mutableBytes], [outBytes length]);
//		CHECK;
//
//		txt = [[NSString alloc] initWithData:outBytes encoding: NSUTF8StringEncoding];
//		[outBytes release];
//		[txt autorelease];
//
//		return txt;
//	}
//
//	if (desc->descriptorType == typeSInt16)
//	{
//		SInt16 buf;
//		AEGetDescData(desc, &buf, sizeof(buf));
//		return [NSNumber numberWithShort:buf];
//	}
//
//	return [NSString stringWithFormat:@"[unconverted AEDesc, type=\"%c%c%c%c\"]", ((char *)&(desc->descriptorType))[0], ((char *)&(desc->descriptorType))[1], ((char *)&(desc->descriptorType))[2], ((char *)&(desc->descriptorType))[3]];
//}

@interface Reports ()

- (void)runScript:(NSString*)txt;

@end

@implementation Reports

+ (NSString*) getUniqueFilename:(id) study
{
	NSString *s = [study valueForKey:@"accessionNumber"];
	
	if( [s length] > 0)
		return [DicomFile NSreplaceBadCharacter: [[study valueForKey:@"patientUID"] stringByAppendingFormat:@"-%@", [study valueForKey:@"accessionNumber"]]];
	else
		return [DicomFile NSreplaceBadCharacter: [[study valueForKey:@"patientUID"] stringByAppendingFormat:@"-%@", [study valueForKey:@"studyInstanceUID"]]];
}

+ (NSString*) getOldUniqueFilename:(NSManagedObject*) study
{
	return [DicomFile NSreplaceBadCharacter: [[study valueForKey:@"patientUID"] stringByAppendingFormat:@"-%@", [study valueForKey:@"id"]]];
}



- (NSString *) HFSStyle: (NSString*) string
{
	return [[(NSURL *)CFURLCreateWithFileSystemPath( kCFAllocatorDefault, (CFStringRef)string, kCFURLHFSPathStyle, NO) autorelease] path];
}

- (NSString *) HFSPathFromPOSIXPath: (NSString*) p
{
    // thanks to stone.com for the pointer to  CFURLCreateWithFileSystemPath()

    CFURLRef    url;
    CFStringRef hfsPath = NULL;

    BOOL        isDirectoryPath = [p hasSuffix:@"/"];
    // Note that for the usual case of absolute paths,  isDirectoryPath is
    // completely ignored by CFURLCreateWithFileSystemPath.
    // isDirectoryPath is only considered for relative paths.
    // This code has not really been tested relative paths...

    url = CFURLCreateWithFileSystemPath(kCFAllocatorDefault,
                                          (CFStringRef)p,
                                          kCFURLPOSIXPathStyle,
                                          isDirectoryPath);
    if (NULL != url) {

        // Convert URL to a colon-delimited HFS path
        // represented as Unicode characters in an NSString.

        hfsPath = CFURLCopyFileSystemPath(url, kCFURLHFSPathStyle);
        if (NULL != hfsPath) {
            [(NSString *)hfsPath autorelease];
        }
        CFRelease(url);
    }

    return (NSString *) hfsPath;
}

- (NSString*) getDICOMStringValueForField: (NSString*) rawField inDICOMFile: (NSString*) path
{
    NSLog( @"Report: DICOM_Field: %@", rawField);
    
    @try {
        NSArray *dicomFields = [rawField componentsSeparatedByString: @":"];
        
        DCMObject *dcmObject = [DCMObject objectWithContentsOfFile: path decodingPixelData:NO];
        if( dcmObject)
        {
            id lastObj = nil;
            for( NSString *dicomField in dicomFields)
            {
                dicomField = [dicomField stringByReplacingOccurrencesOfString:@" " withString:@""];
                
                if( lastObj == nil)
                    lastObj = [dcmObject attributeWithName: dicomField];
                
                if( lastObj == nil)
                    lastObj = [dcmObject attributeForTag: [DCMAttributeTag tagWithTagString: dicomField]];
                
                if( lastObj == nil)
                    break;
                
                if( [lastObj isKindOfClass: [DCMSequenceAttribute class]] == NO)
                    break;
                else
                {
                    dcmObject = [[lastObj sequence] objectAtIndex: 0]; // Read only first item...
                    
                    if( [dicomFields lastObject] != dicomField)
                        lastObj = 0;
                }
            }
            
            if( [lastObj isKindOfClass: [DCMSequenceAttribute class]])
                lastObj = [lastObj readableDescription];
            
            if( [lastObj isKindOfClass: [DCMAttribute class]])
                lastObj = [lastObj value];
            
            if( [lastObj isKindOfClass: [NSString class]])
                return lastObj;
        }
    }
    @catch ( NSException *e) {
        N2LogException( e);
    }
        
    NSLog( @"**** Dicom field not found: %@ in %@", rawField, path);
    
    return nil;
}

- (BOOL) createNewReport:(NSManagedObject*) study destination:(NSString*) path type:(int) type
{
	NSString *uniqueFilename = [Reports getUniqueFilename: study];
	
	switch( type)
	{
		case 1://rtf
		{
			NSString *destinationFile = [NSString stringWithFormat:@"%@%@.%@", path, uniqueFilename, @"rtf"];
			[[NSFileManager defaultManager] removeItemAtPath: destinationFile error: nil];
			
			[[NSFileManager defaultManager] copyPath:[BrowserController.currentBrowser.database.baseDirPath stringByAppendingFormat:@"/ReportTemplate.rtf"] toPath:destinationFile handler: nil];
			
			NSDictionary                *attr;
			NSMutableAttributedString	*rtf = [[NSMutableAttributedString alloc] initWithRTF: [NSData dataWithContentsOfFile:destinationFile] documentAttributes:&attr];
			NSString					*rtfString = [rtf string];
			NSRange						range;
			
			// SCAN FIELDS
			
			NSManagedObjectModel	*model = [[[study managedObjectContext] persistentStoreCoordinator] managedObjectModel];
			NSArray *properties = [[[[model entitiesByName] objectForKey:@"Study"] attributesByName] allKeys];
			
			
			NSDateFormatter		*date = [[[NSDateFormatter alloc] init] autorelease];
			[date setDateStyle: NSDateFormatterShortStyle];
			
			for( NSString *name in properties)
			{
				NSString	*string;
				
				if( [[study valueForKey: name] isKindOfClass: [NSDate class]])
				{
					string = [date stringFromDate: [study valueForKey: name]];
				}
				else string = [[study valueForKey: name] description];
				
				NSRange	searchRange = rtf.range;
				
				do
				{
					range = [rtfString rangeOfString: [NSString stringWithFormat:@"«%@»", name] options:0 range:searchRange];
					
					if( range.length > 0)
					{
						if( string)
						{
							[rtf replaceCharactersInRange:range withString:string];
						}
						else [rtf replaceCharactersInRange:range withString:@""];
						
						searchRange = NSMakeRange( range.location, [rtf length]-(range.location+1));
					}
				}while( range.length != 0);
			}
			
			// TODAY
			
			NSRange	searchRange = rtf.range;
			
			range = [rtfString rangeOfString: @"«today»" options:0 range: searchRange];
			if( range.length > 0)
			{
				[rtf replaceCharactersInRange:range withString:[date stringFromDate: [NSDate date]]];
			}
			
			// DICOM Fields
			NSArray	*seriesArray = [[BrowserController currentBrowser] childrenArray: study];
			if( [seriesArray count] > 0)
			{
				NSArray	*imagePathsArray = [[BrowserController currentBrowser] imagesPathArray: [seriesArray objectAtIndex: 0]];
				BOOL moreFields = NO;
				do
				{
					NSRange firstChar = [rtfString rangeOfString: @"«DICOM_FIELD:"];
					if( firstChar.location != NSNotFound)
					{
						NSRange secondChar = [rtfString rangeOfString: @"»"];
						
						if( secondChar.location != NSNotFound)
						{
                            NSString *rawField = [rtfString substringWithRange: NSMakeRange( firstChar.location+firstChar.length, secondChar.location - (firstChar.location+firstChar.length))];
                            NSString *v = [self getDICOMStringValueForField: rawField inDICOMFile: [imagePathsArray objectAtIndex: 0]];
                            if( v)
                                [rtf replaceCharactersInRange:NSMakeRange(firstChar.location, secondChar.location-firstChar.location+1) withString: v];
                            else
                                [rtf replaceCharactersInRange:NSMakeRange(firstChar.location, secondChar.location-firstChar.location+1) withString:@""];
                            
                            moreFields = YES;
						}
						else moreFields = NO;
					}
					else moreFields = NO;
				}
				while( moreFields);
			}
			
			[[rtf RTFFromRange:rtf.range documentAttributes:attr] writeToFile:destinationFile atomically:YES];
			
			[rtf release];
			[study setValue: destinationFile forKey:@"reportURL"];
			
			[[NSWorkspace sharedWorkspace] openFile:destinationFile withApplication:@"TextEdit" andDeactivate: YES];
			[NSThread sleepForTimeInterval: 1];
		}
		break;
		
		case 5:
		{
			NSString *destinationFile = [NSString stringWithFormat:@"%@%@.%@", path, uniqueFilename, @"odt"];
			[[NSFileManager defaultManager] removeItemAtPath: destinationFile error: nil];
			
			[[NSFileManager defaultManager] copyPath:[BrowserController.currentBrowser.database.baseDirPath stringByAppendingFormat:@"/ReportTemplate.odt"] toPath:destinationFile handler: nil];
			[self createNewOpenDocumentReportForStudy:study toDestinationPath:destinationFile];
			
		}
		break;
	}
	return YES;
}

// initialize it in your init method:

- (void) dealloc
{
	[templateName release];
	
	[super dealloc];
}

- (id)init
{
	self = [super init];
	if (self)
	{
		templateName = [[NSMutableString stringWithString:@""] retain];
	}
	return self;
}

// do the grunge work -

// the sweetly wrapped method is all we need to know:

- (void)runScript:(NSString *)txt
{
    NSAppleScript* as = [[[NSAppleScript alloc] initWithSource:txt] autorelease];
    NSDictionary* errs = nil;
    [as runWithArguments:nil error:&errs];
    if ([errs count])
        NSLog(@"Error: AppleScript execution failed: %@", errs);
}

+(id)_runAppleScript:(NSString*)source withArguments:(NSArray*)args
{
    NSDictionary* errs = nil;
    
    if (!source) [NSException raise:NSGenericException format:@"Couldn't read script source"];
    
    NSAppleScript* script = [[[NSAppleScript alloc] initWithSource:source] autorelease];
    if (!script) [NSException raise:NSGenericException format:@"Invalid script source"];
    
    id r = [script runWithArguments:args error:&errs];
    if (errs) [NSException raise:NSGenericException format:@"%@", errs];
    
    return r;
}

#pragma mark -

- (void)searchAndReplaceFieldsFromStudy:(NSManagedObject*)aStudy inString:(NSMutableString*)aString;
{
	if( aString == nil)
		return;
		
	NSManagedObjectModel *model = [[[aStudy managedObjectContext] persistentStoreCoordinator] managedObjectModel];
	NSArray *properties = [[[[model entitiesByName] objectForKey:@"Study"] attributesByName] allKeys];
	
	NSDateFormatter		*date = [[[NSDateFormatter alloc] init] autorelease];
	[date setDateStyle: NSDateFormatterShortStyle];
    
    NSDateFormatter		*longDate = [[[NSDateFormatter alloc] init] autorelease];
	[longDate setDateStyle: NSDateFormatterLongStyle];
	
	for( NSString *propertyName in properties)
	{
		NSString *propertyValue;
		
		if( [[aStudy valueForKey:propertyName] isKindOfClass:[NSDate class]])
			propertyValue = [date stringFromDate: [aStudy valueForKey:propertyName]];
		else
			propertyValue = [[aStudy valueForKey:propertyName] description];
			
		if(!propertyValue)
			propertyValue = @"";
			
		//		« is encoded as &#xAB;
		//      » is encoded as &#xBB;
		[aString replaceOccurrencesOfString:[NSString stringWithFormat:@"&#xAB;%@&#xBB;", propertyName] withString:propertyValue options:NSLiteralSearch range:aString.range];
		[aString replaceOccurrencesOfString:[NSString stringWithFormat:@"«%@»", propertyName] withString:propertyValue options:NSLiteralSearch range:aString.range];
	}
	
	// "today"
	[aString replaceOccurrencesOfString:@"&#xAB;today&#xBB;" withString:[date stringFromDate: [NSDate date]] options:NSLiteralSearch range:aString.range];
	[aString replaceOccurrencesOfString:@"«today»" withString:[date stringFromDate: [NSDate date]] options:NSLiteralSearch range:aString.range];
    
    [aString replaceOccurrencesOfString:@"&#xAB;longtoday&#xBB;" withString:[longDate stringFromDate: [NSDate date]] options:NSLiteralSearch range:aString.range];
	[aString replaceOccurrencesOfString:@"«longtoday»" withString:[longDate stringFromDate: [NSDate date]] options:NSLiteralSearch range:aString.range];
	
	NSArray	*seriesArray = [[BrowserController currentBrowser] childrenArray: aStudy];
	NSArray	*imagePathsArray = [[BrowserController currentBrowser] imagesPathArray: [seriesArray objectAtIndex: 0]];
	
	// DICOM Fields
	BOOL moreFields = NO;
	do
	{
		NSRange firstChar = [aString rangeOfString: @"&#xAB;DICOM_FIELD:"];
		
		if( firstChar.location == NSNotFound)
			firstChar = [aString rangeOfString: @"«DICOM_FIELD:"];
		
		if( firstChar.location != NSNotFound)
		{
			NSRange secondChar = [aString rangeOfString: @"&#xBB;" options: 0 range: NSMakeRange( firstChar.location+firstChar.length, aString.length - (firstChar.location+firstChar.length)) locale: nil];
			if( secondChar.location == NSNotFound)
				secondChar = [aString rangeOfString: @"»"];
			
			if( secondChar.location != NSNotFound)
			{
				NSString *dicomField = [aString substringWithRange: NSMakeRange( firstChar.location+firstChar.length, secondChar.location - (firstChar.location+firstChar.length))];
				
                if( dicomField.length) // delete the <blabla> strings
                {
                    dicomField = [dicomField stringByReplacingOccurrencesOfString:@" " withString:@""];
                    
                    NSRange sChar;
                    do
                    {
                        sChar = [dicomField rangeOfString: @"<"];
                        if( sChar.location != NSNotFound)
                        {
                            NSRange sChar2 = [dicomField rangeOfString: @">"];
                            
                            if( sChar2.location != NSNotFound)
                                dicomField = [dicomField stringByReplacingCharactersInRange:NSMakeRange( sChar.location, sChar2.location + sChar2.length - sChar.location) withString:@""];
                        }
                    }
                    while( sChar.location != NSNotFound);
				}
                
                NSString *s = [self getDICOMStringValueForField: dicomField inDICOMFile: [imagePathsArray objectAtIndex: 0]];
                
				if( s)
                    [aString replaceCharactersInRange:NSMakeRange(firstChar.location, secondChar.location-firstChar.location+secondChar.length) withString: s];
                else
                    [aString replaceCharactersInRange:NSMakeRange(firstChar.location, secondChar.location-firstChar.location+secondChar.length) withString:@""];
                
				moreFields = YES;
			}
			else moreFields = NO;
		}
		else moreFields = NO;
	}
	while( moreFields);
}





#pragma mark -
#pragma mark OpenDocument

- (BOOL) createNewOpenDocumentReportForStudy:(NSManagedObject*)aStudy toDestinationPath:(NSString*)aPath;
{
	// decompress the gzipped index.xml.gz file in the .pages bundle
	NSTask *unzip = [[[NSTask alloc] init] autorelease];
	[unzip setLaunchPath:@"/usr/bin/unzip"];
	[unzip setCurrentDirectoryPath: [aPath stringByDeletingLastPathComponent]];
	
	[[NSFileManager defaultManager] removeItemAtPath: [[aPath stringByDeletingLastPathComponent] stringByAppendingPathComponent: @"OOOsiriX"] error: nil];
	[unzip setArguments: [NSArray arrayWithObjects: aPath, @"-d", @"OOOsiriX", nil]];
	[unzip launch];

	while( [unzip isRunning])
        [NSThread sleepForTimeInterval: 0.1];
    
    //[aTask waitUntilExit];		// <- This is VERY DANGEROUS : the main runloop is continuing...
	int status = [unzip terminationStatus];
 
	if (status == 0)
		NSLog(@"OO Report creation. unzip -d succeeded.");
	else
	{
		NSLog(@"OO Report creation  failed. Cause: unzip -d failed.");
		return NO;
	}
	
	// read the xml file and find & replace templated string with patient's datas
	NSString *indexFilePath = [NSString stringWithFormat:@"%@/OOOsiriX/content.xml", [aPath stringByDeletingLastPathComponent]];
	NSError *xmlError = nil;
	NSStringEncoding xmlFileEncoding = NSUTF8StringEncoding;
	NSMutableString *xmlContentString = [NSMutableString stringWithContentsOfFile:indexFilePath encoding:xmlFileEncoding error:&xmlError];
	
	[self searchAndReplaceFieldsFromStudy:aStudy inString:xmlContentString];
	
	if(![xmlContentString writeToFile:indexFilePath atomically:YES encoding:xmlFileEncoding error:&xmlError])
		return NO;
	
	// zip back the index.xml file
	unzip = [[[NSTask alloc] init] autorelease];
	[unzip setLaunchPath:@"/usr/bin/zip"];
	[unzip setCurrentDirectoryPath: [[aPath stringByDeletingLastPathComponent] stringByAppendingPathComponent: @"OOOsiriX"]];
	[unzip setArguments: [NSArray arrayWithObjects: @"-q", @"-r", aPath, @"content.xml", nil]];
	[unzip launch];

	while( [unzip isRunning])
        [NSThread sleepForTimeInterval: 0.1];
    
    //[aTask waitUntilExit];		// <- This is VERY DANGEROUS : the main runloop is continuing...
	status = [unzip terminationStatus];
 
	if (status == 0)
		NSLog(@"OO Report creation. zip succeeded.");
	else
	{
		NSLog(@"OO Report creation  failed. Cause: zip failed.");
		// we don't need to return NO, because the xml has been modified. Thus, even if the file is not compressed, the report is valid...
	}
	
	[[NSFileManager defaultManager] removeItemAtPath: [[aPath stringByDeletingLastPathComponent] stringByAppendingPathComponent: @"OOOsiriX"] error: nil];
	
	[aStudy setValue:aPath forKey:@"reportURL"];
	
	// open the modified .odt file
	if( [[NSWorkspace sharedWorkspace] openFile:aPath withApplication: @"LibreOffice" andDeactivate: YES] == NO)
    {
        if( [[NSWorkspace sharedWorkspace] openFile:aPath withApplication: @"OpenOffice" andDeactivate: YES] == NO)
            [[NSWorkspace sharedWorkspace] openFile:aPath withApplication: nil andDeactivate: YES];
	}
    [NSThread sleepForTimeInterval: 1];
	
	// end
	return YES;
}

- (NSMutableString *)templateName;
{
	return templateName;
}

- (void)setTemplateName:(NSString *)aName;
{
	[templateName setString:aName];
	[templateName replaceOccurrencesOfString:@".pages" withString:@"" options:NSLiteralSearch range:templateName.range];
    [templateName replaceOccurrencesOfString:@".docx" withString:@"" options:NSLiteralSearch range:templateName.range];
    [templateName replaceOccurrencesOfString:@".doc" withString:@"" options:NSLiteralSearch range:templateName.range];
}

@end
