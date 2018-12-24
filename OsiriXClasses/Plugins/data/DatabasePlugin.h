#import "Plugin.h"
#import "DicomStudy.h"

@interface DatabasePlugin : Plugin {
}

-(NSMutableSet*)selectedDicomStudy;


/*
 
 NSManagedObjectModel   *model = [[[study managedObjectContext] persistentStoreCoordinator] managedObjectModel];
 NSArray *properties = [[[[model entitiesByName] objectForKey:@"Study"] attributesByName] allKeys];
 
 
 NSDateFormatter      *date = [[[NSDateFormatter alloc] init] autorelease];
 [date setDateStyle: NSDateFormatterShortStyle];
 
 for( NSString *name in properties)

 
 NSArray   *seriesArray = [[BrowserController currentBrowser] childrenArray: study];

 
 [study setValue: destinationFile forKey:@"reportURL"];
 
 [[NSWorkspace sharedWorkspace] openFile:destinationFile withApplication:@"TextEdit" andDeactivate: YES];
 [NSThread sleepForTimeInterval: 1];

 
 */

@end
