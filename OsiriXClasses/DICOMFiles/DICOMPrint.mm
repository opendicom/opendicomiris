#import <Foundation/Foundation.h>

int main(int argc, const char *argv[])
{
	NSAutoreleasePool	*pool	= [[NSAutoreleasePool alloc] init];
	
	NSLog(@"DICOM Print Process Start");
	
	if( argv[ 1] && argv[ 2] && argv[ 3])
	{
#pragma mark TODO replace sendPrintJob
      //int status = -1;
      
      //   argv[ 1] : logPath
      //   argv[ 2] : baseName
      //   argv[ 3] : xmlPath
		// send printjob
		//DicomPrintSCU printSCU = DicomPrintSCU( argv[ 1], 0, argv[ 2]);

		//status = printSCU.sendPrintjob( argv[ 3]);
	}

	NSLog(@"DICOM Print Process End");
	
	[pool release];
	
	return status;
}
