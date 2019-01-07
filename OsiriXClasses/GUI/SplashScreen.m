#import "SplashScreen.h"

@implementation SplashScreen

- (void)windowDidLoad
{ 
	[[self window] center];
	versionType  = 0;
	[self switchVersion: self];
	[[self window] setDelegate:self];
}

- (IBAction) switchVersion:(id) sender
{
   NSLog(@"switchVersion %d",versionType);
	NSString *currVersionNumber=nil;
	
	switch( versionType)
   {
        case 0:
            if( sizeof(long) == 8) currVersionNumber=@"64-bit";
            else                   currVersionNumber=@"32-bit";
        break;
        
        case 1:
            currVersionNumber = [[[NSBundle bundleForClass:[self class]] infoDictionary] objectForKey:@"CFBundleVersion"];
        break;
        
        case 2:
            currVersionNumber = [[[NSBundle bundleForClass:[self class]] infoDictionary] objectForKey:@"GitHash"];
            
            [[NSPasteboard generalPasteboard] clearContents];
            [[NSPasteboard generalPasteboard] writeObjects:[NSArray arrayWithObject: currVersionNumber]];
        break;
	}
	
	[version setTitle: currVersionNumber];

    versionType++;
    
    if( versionType >= 3)
        versionType = 0;
}

- (IBAction)showWindow:(id)sender{
	[super showWindow:sender];	
	//NSLog(@"show Splash screen");
}

-(id) init
{
	self = [super initWithWindowNibName:@"Splash"];
 return self;
}

- (BOOL)windowShouldClose:(id)sender
{
   return YES;
}

- (IBAction) openGitHub:(id) sender
{
   NSLog(@"github");
}
@end
