#import "Plugin.h"

@interface ImagePlugin : Plugin {
}

+(void)classProcess:(id)object sender:(id)sender;
-(void)initPlugin;
-(long)process:(id)object sender:(id)sender;

/** Return the complete lists of opened studies in OsiriX */
/** NSArray contains an array of ViewerController objects */
//-(NSArray*) viewerControllersList;
//[ViewerController getDisplayed2DViewers];

/** Create a new 2D window, containing a copy of the current series */
//-(ViewerController*) duplicateCurrent2DViewerWindow;
//[[ViewerController frontMostDisplayed2DViewer] copyViewerWindow];

@end


@interface Plugin (Optional)

/** Called to pass the plugin all sorts of events sent to a DCMView.  */

-(BOOL)handleEvent:(NSEvent*)event forViewer:(id)controller;
-(NSArray*)toolbarAllowedIdentifiersForViewer:(id)controller;
-(NSToolbarItem*)toolbarItemForItemIdentifier:(NSString*) identifier forViewer:(id)controller;

-(BOOL)handleEvent:(NSEvent*)event forVRViewer:(id)controller;
-(NSArray*)toolbarAllowedIdentifiersForVRViewer:(id)controller;
-(NSToolbarItem*)toolbarItemForItemIdentifier:(NSString*) identifier forVRViewer:(id)controller;

-(NSArray*)toolbarAllowedIdentifiersForBrowserController:(id)controller;
-(NSToolbarItem*)toolbarItemForItemIdentifier:(NSString*) identifier forBrowserController:(id)controller;
@end;
