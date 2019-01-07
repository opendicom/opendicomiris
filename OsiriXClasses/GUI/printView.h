#import <Cocoa/Cocoa.h>
#import "ViewerController.h"


//JF View used for printing from ViewerController
@interface printView : NSView
{
	id						viewer;
	NSDictionary		*settings;
	NSArray				*filesToPrint;
	int					columns;
	int						rows;
	int						ipp;
	float					headerHeight;
}

- (id)initWithViewer:(id) v
			settings:(NSDictionary*) s
			   files:(NSArray*) f
		   printInfo:(NSPrintInfo*) pi;
- (int)columns;
- (int)rows;
- (int)ipp;

@end
