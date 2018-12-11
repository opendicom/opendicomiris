#import <Cocoa/Cocoa.h>
#import "DCMPix.h"				// object image, including pixels values
#import "ViewerController.h"	// object 2D Viewer window
#import "DCMView.h"				// object 2D pane, contained in a 2D Viewer window
#import "MyPoint.h"				// object point
#import "ROI.h"					// object ROI


@interface PluginFilter : NSObject
{
	ViewerController* viewerController;// frontmost and active 2D viewer containing a serie
}

+(PluginFilter *)filter;

// FUNCTIONS TO SUBCLASS

/** This function is called to apply your plugin */
-(long)filterImage: (NSString*) menuName;

/** This function is the entry point of Pre-Process plugins */
-(long)processFiles: (NSMutableArray*) files;

/** This function is called at the OsiriX startup, if you need to do some memory allocation, etc. */
-(void)initPlugin;

/** This function is called if OsiriX needs to kill the current running plugin, to install an update, for example. */
-(void)willUnload;

/** This function is called if OsiriX needs to display a warning to the user about a non-certified plugin. */
-(BOOL)isCertifiedForMedicalImaging;

/** Opportunity for plugins to make Menu changes if necessary */

-(void)setMenus;

// UTILITY FUNCTIONS - Defined in the PluginFilter.m file

/** Return the complete lists of opened studies in OsiriX */
/** NSArray contains an array of ViewerController objects */
-(NSArray*) viewerControllersList;

/** Create a new 2D window, containing a copy of the current series */
-(ViewerController*) duplicateCurrent2DViewerWindow;

// Following stubs are to be subclassed by report filters.  Included here to remove compile-time warning messages.
/** Stub is to be subclassed by report filters */
-(BOOL)deleteReportForStudy: (NSManagedObject*)study;
/** Stub is to be subclassed by report filters */
-(BOOL)createReportForStudy: (NSManagedObject*)study;
/** Stub is to be subclassed by report filters */
-(BOOL)signReportForStudy: (NSManagedObject*)study;
/** Stub is to be subclassed by report filters */
-(BOOL)authenticateReportForStudy: (NSManagedObject*)study;

/** PRIVATE FUNCTIONS - DON'T SUBCLASS OR MODIFY */
-(long)prepareFilter:(ViewerController*) vC;
@end

@interface PluginFilter (Optional)

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
