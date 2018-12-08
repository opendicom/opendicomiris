#import <AppKit/AppKit.h>
#import "XMLRPCMethods.h"

@class PreferenceController;
@class BrowserController;
@class SplashScreen;
@class DCMNetServiceDelegate;
@class WebPortal;

enum
{
	compression_sameAsDefault = 0,
	compression_none = 1,
	compression_JPEG = 2,
	compression_JPEG2000 = 3,
   compression_JPEGLS = 4
};

enum
{
	always = 0,
	cdOnly = 1,
	notMainDrive = 2,
	ask = 3
};

@class PluginFilter;

#ifdef __cplusplus
extern "C"
{
#endif
	NSRect screenFrame();
	NSString * documentsDirectoryFor( int mode, NSString *url) __deprecated;
	NSString * documentsDirectory() __deprecated;
#ifdef __cplusplus
}
#endif


/** \brief  NSApplication delegate
*
*  NSApplication delegate 
*  Primarily manages the user defaults and server
*  Also controls some general main items
*
*
*/

@class AppController, ToolbarPanelController, ThumbnailsListPanel, BonjourPublisher;

extern AppController* OsiriX;

@interface AppController : NSObject	<NSNetServiceBrowserDelegate, NSNetServiceDelegate, NSSoundDelegate, NSMenuDelegate>
{
	IBOutlet BrowserController *browserController;

   IBOutlet NSMenu				*filtersMenu;
	IBOutlet NSMenu				*roisMenu;
	IBOutlet NSMenu				*othersMenu;
	IBOutlet NSMenu				*dbMenu;
	IBOutlet NSWindow				*dbWindow;
   IBOutlet NSMenu				*windowsTilingMenuRows;
   IBOutlet NSMenu            *windowsTilingMenuColumns;
   IBOutlet NSMenu            *recentStudiesMenu;
	
	NSDictionary					*previousDefaults;
	
	BOOL							   showRestartNeeded;
		
   SplashScreen					*splashController;
	
   volatile BOOL					quitting;
	BOOL							   verboseUpdateCheck;
	NSNetService					*BonjourDICOMService;
	
	NSTimer							*updateTimer;
	XMLRPCInterface				*XMLRPCServer;
	
   BOOL							   checkAllWindowsAreVisibleIsOff;
   BOOL                       isSessionInactive;
	
   int								lastColumns;
   int                        lastRows;
   int                        lastCount;
    
   BonjourPublisher*          _bonjourPublisher;
}

@property BOOL checkAllWindowsAreVisibleIsOff;
@property BOOL isSessionInactive;
@property (readonly) NSMenu *filtersMenu;
@property (readonly) NSMenu *recentStudiesMenu;
@property (readonly) NSMenu *windowsTilingMenuRows;
@property (readonly) NSMenu *windowsTilingMenuColumns;
@property(readonly) NSNetService* dicomBonjourPublisher;
@property (readonly) XMLRPCInterface *XMLRPCServer;
@property(readonly) BonjourPublisher* bonjourPublisher;

//singleton
+ (AppController*) sharedAppController;

+ (BOOL) isFDACleared;
+ (BOOL) willExecutePlugin;
+ (BOOL) willExecutePlugin:(id) filter;
+ (BOOL) hasMacOSXLion;
+ (BOOL) hasMacOSXSnowLeopard;

+(NSString*)UID;

#pragma mark-
#pragma mark initialization of the main event loop

+ (void) createNoIndexDirectoryIfNecessary:(NSString*) path __deprecated;
+ (void) resizeWindowWithAnimation:(NSWindow*) window newSize: (NSRect) newWindowFrame;
+ (void) pause __deprecated;
+ (ThumbnailsListPanel*)thumbnailsListPanelForScreen:(NSScreen*)screen;
+ (NSString*)printStackTrace:(NSException*)e __deprecated; // use -[NSException printStackTrace] form NSException+N2
+ (BOOL) isKDUEngineAvailable;


#pragma mark-
#pragma mark  Server management
- (void) terminate :(id) sender; /**< Terminate listener (Q/R SCP) */
- (void) restartSTORESCP; /**< Restart listener (Q/R SCP) */
- (void) startSTORESCP:(id) sender; /**< Start listener (Q/R SCP) */
- (void) startSTORESCPTLS:(id) sender; /**< Start TLS listener (Q/R SCP) */
- (BOOL) isStoreSCPRunning;

#pragma mark-
#pragma mark static menu items
//===============OSIRIX========================
- (IBAction) about:(id)sender; /**< Display the about window */
- (IBAction) showPreferencePanel:(id)sender; /**< Show Preferences window */
#ifndef OSIRIX_LIGHT
- (IBAction) autoQueryRefresh:(id)sender;
#endif
//===============WINDOW========================
- (IBAction) setFixedTilingRows: (id) sender;
- (IBAction) setFixedTilingColumns: (id) sender;
- (void) initTilingWindows;
- (IBAction) tileWindows:(id)sender;  /**< Tile open window */
- (IBAction) tile3DWindows:(id)sender; /**< Tile 3D open window */
- (void) tileWindows:(id)sender windows: (NSMutableArray*) viewersList display2DViewerToolbar: (BOOL) display2DViewerToolbar displayThumbnailsList: (BOOL) displayThumbnailsList;
- (void) scaleToFit:(id)sender;    /**< Scale opened windows */
- (IBAction) closeAllViewers: (id) sender;  /**< Close All Viewers */
- (void) checkAllWindowsAreVisible:(id) sender;
- (void) checkAllWindowsAreVisible:(id) sender makeKey: (BOOL) makeKey;
//---------------------------------------------

- (IBAction) killAllStoreSCU:(id) sender;

- (id) splashScreen;

#pragma mark-
#pragma mark window routines
- (IBAction) updateViews:(id) sender;  /**< Update Viewers */
- (NSScreen *)dbScreen;  /**< Return monitor with DB */
- (NSArray *)viewerScreens; /**< Return array of monitors for displaying viewers */

 /** 
 * Find the WindowController with the named nib and using the pixList
 * This is commonly used to find the 3D Viewer associated with a ViewerController.
 * Conversely this could be used to find the ViewerController that created a 3D Viewer
 * Each 3D Viewer has its own distinctly named nib as does the ViewerController.
 * The pixList is the Array of DCMPix that the viewer uses.  It should uniquely identify related viewers
*/
- (id) FindViewer:(NSString*) nib :(NSArray*) pixList;
- (NSArray*) FindRelatedViewers:(NSArray*) pixList; /**< Return an array of all WindowControllers using the pixList */
- (IBAction) cancelModal: (id) sender;
- (IBAction) okModal: (id) sender;
- (NSString*) privateIP;
- (void) killDICOMListenerWait:(BOOL) w;
- (void) runPreferencesUpdateCheck:(NSTimer*) timer;
+ (void) checkForPreferencesUpdate: (BOOL) b;
+ (BOOL) USETOOLBARPANEL;
+ (void) setUSETOOLBARPANEL: (BOOL) b;
+ (NSRect) usefullRectForScreen: (NSScreen*) screen;

- (void) addStudyToRecentStudiesMenu: (NSManagedObjectID*) studyID;
- (void) loadRecentStudy: (id) sender;
- (void) buildRecentStudiesMenu;

- (NSMenu*) viewerMenu;
- (NSMenu*) fileMenu;
- (NSMenu*) exportMenu;
- (NSMenu*)imageTilingMenu;
- (NSMenu*) orientationMenu;
- (NSMenu*) opacityMenu;
- (NSMenu*) wlwwMenu;
- (NSMenu*) convMenu;
- (NSMenu*) clutMenu;
- (NSMenu*) workspaceMenu;

#pragma mark-
#pragma mark 12 Bit Display support.
+ (BOOL)canDisplay12Bit;
+ (void)setCanDisplay12Bit:(BOOL)boo;
+ (void)setLUT12toRGB:(unsigned char*)lut;
+ (unsigned char*)LUT12toRGB;
+ (void)set12BitInvocation:(NSInvocation*)invocation;
+ (NSInvocation*)fill12BitBufferInvocation;

#pragma mark -
-(WebPortal*)defaultWebPortal;

-(NSString*)weasisBasePath;

@end

