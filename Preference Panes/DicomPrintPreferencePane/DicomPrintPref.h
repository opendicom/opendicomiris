#import <PreferencePanes/PreferencePanes.h>

@interface DicomPrintPref : NSPreferencePane
{
	NSArray *m_PrinterDefaults;
	IBOutlet NSArrayController *m_PrinterController;
	IBOutlet NSWindow *mainWindow;
}

- (IBAction) addPrinter: (id) sender;
- (IBAction) setDefaultPrinter: (id) sender;

- (IBAction) loadList: (id) sender;
- (IBAction) saveList: (id) sender;

@end
