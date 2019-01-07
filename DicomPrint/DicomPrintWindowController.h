#import <Cocoa/Cocoa.h>

@class ViewerController;

@interface DicomPrintWindowController : NSWindowController <NSWindowDelegate>
{
	NSImage *m_PrinterOnImage;
	NSImage *m_PrinterOffImage;
	ViewerController *m_CurrentViewer;

	IBOutlet NSMatrix          *m_ImageSelection;
	IBOutlet NSArrayController *m_PrinterController;

	IBOutlet NSPanel *m_ProgressSheet;
	IBOutlet NSTextField *m_ProgressMessage;
	IBOutlet NSTabView *m_ProgressTabView;
	IBOutlet NSButton *m_ProgressOKButton;
	IBOutlet NSProgressIndicator *m_ProgressIndicator;

	IBOutlet NSButton		*m_PrintButton;
	IBOutlet NSButton		*m_ToggleDrawerButton;
	IBOutlet NSButton		*m_VerifyConnectionButton;
	
	IBOutlet NSBox			*entireSeriesBox;
	IBOutlet NSSlider		*entireSeriesInterval, *entireSeriesFrom, *entireSeriesTo;
	IBOutlet NSTextField	*entireSeriesIntervalText, *entireSeriesFromText, *entireSeriesToText;
	IBOutlet NSTextField	*m_pages;
	
	IBOutlet NSPopUpButton	*formatPopUp;
	IBOutlet NSTextField	*m_VersionNumberTextField;
	
	NSLock					*printing;
    
    NSRect windowFrameToRestore;
    BOOL scaleFitToRestore;

}
+ (void) updateAllPreferencesFormat;

- (IBAction) cancel: (id) sender;
- (IBAction) printImages: (id) sender;
- (IBAction) verifyConnection: (id) sender;
- (IBAction) closeSheet: (id) sender;
- (IBAction) setExportMode:(id) sender;
- (IBAction) exportDICOMSlider:(id) sender;
- (IBAction) setPages:(id) sender;

@end
