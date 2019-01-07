#import <Cocoa/Cocoa.h>

@interface SplashScreen : NSWindowController <NSWindowDelegate>
{
	IBOutlet	NSButton * version;
	IBOutlet	id         view;
	int                 versionType;
}

- (IBAction) switchVersion:(id) sender;
- (IBAction) openGitHub:(id) sender;
@end
