#import <Cocoa/Cocoa.h>
#import "ViewerController.h"
#import "DCMView.h"
#import "DCMPix.h"

enum
{
	eCurrentImage = 0,
	eKeyImages = 1,
	eAllImages = 2,
};

struct rawData
{
	unsigned char *imageData;
	long bytesWritten;
};


//Creates DICOM print images
@interface NSImageToDicomPrint : NSObject
{
	NSMutableData	*m_ImageDataBytes;
}

- (NSArray *) dicomFileListForViewer: (ViewerController *) currentViewer
                     destinationPath: (NSString *) destPath
                             options: (NSDictionary*) options
                     withAnnotations: (BOOL) annotations;

- (NSArray *) dicomFileListForViewer: (ViewerController *) currentViewer
                     destinationPath: (NSString *) destPath
                             options: (NSDictionary*) options
                            fileList: (NSArray *) fileList
                     withAnnotations: (BOOL) annotations;

@end
