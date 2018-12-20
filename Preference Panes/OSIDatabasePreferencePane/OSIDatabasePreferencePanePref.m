/*=========================================================================
  Program:   OsiriX

  Copyright (c) OsiriX Team
  All rights reserved.
  Distributed under GNU - GPL
  
  See http://www.osirix-viewer.com/copyright.html for details.

     This software is distributed WITHOUT ANY WARRANTY; without even
     the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
     PURPOSE.
=========================================================================*/

#import "OSIDatabasePreferencePanePref.h"
#import <PluginManager.h>
#import <BrowserController.h>
#import <PreferencesWindowController+DCMTK.h>
#import <OsiriX/DCMAbstractSyntaxUID.h>
#import <BrowserControllerDCMTKCategory.h>
#import "DicomDatabase.h"
#import "WaitRendering.h"
#import "dicomFile.h"

@implementation OSIDatabasePreferencePanePref

@synthesize currentCommentsAutoFill, currentCommentsField;
@synthesize newUsePatientIDForUID, newUsePatientBirthDateForUID, newUsePatientNameForUID;

- (id) initWithBundle:(NSBundle *)bundle
{
	if( self = [super init])
	{
		NSNib *nib = [[[NSNib alloc] initWithNibNamed: @"OSIDatabasePreferencePanePref" bundle: nil] autorelease];
		[nib instantiateNibWithOwner:self topLevelObjects: nil];
		
		[self setMainView: [mainWindow contentView]];
		[self mainViewDidLoad];
        
        [[NSUserDefaultsController sharedUserDefaultsController] addObserver:self forKeyPath: @"values.eraseEntireDBAtStartup" options: NSKeyValueObservingOptionNew context:nil];
        [[NSUserDefaultsController sharedUserDefaultsController] addObserver:self forKeyPath: @"values.dbFontSize" options: NSKeyValueObservingOptionNew context:nil];
        [[NSUserDefaultsController sharedUserDefaultsController] addObserver:self forKeyPath: @"values.horizontalHistory" options: NSKeyValueObservingOptionNew context:nil];
	}
	
	return self;
}

-(void)observeValueForKeyPath:(NSString*)keyPath ofObject:(id)object change:(NSDictionary*)change context:(void*)context
{
	if (object == [NSUserDefaultsController sharedUserDefaultsController])
    {
		if ([keyPath isEqualToString:@"values.eraseEntireDBAtStartup" ])
        {
            if( [[NSUserDefaults standardUserDefaults] boolForKey: @"eraseEntireDBAtStartup"])
            {
                NSRunCriticalAlertPanel( NSLocalizedString( @"Erase Entire Database", nil), NSLocalizedString( @"Warning! With this option, each time OsiriX is restarted, the entire database will be erased. All studies will be deleted. This cannot be undone.", nil), NSLocalizedString( @"OK", nil), nil, nil);
            }
        }
        
        if ([keyPath isEqualToString:@"values.horizontalHistory" ])
        {
            NSRunCriticalAlertPanel( NSLocalizedString( @"Restart", nil), NSLocalizedString( @"Restart OsiriX to apply this change.", nil), NSLocalizedString( @"OK", nil), nil, nil);
        }
        
        if ([keyPath isEqualToString:@"values.dbFontSize"])
        {
            [[BrowserController currentBrowser] setTableViewRowHeight];
            [[BrowserController currentBrowser] refreshMatrix: self];
            [[[BrowserController currentBrowser] window] display];
        }
    }
}

- (NSArray*) ListOfMediaSOPClassUID // Displayed in DB window
{
	NSMutableArray *l = [NSMutableArray array];
	
    [l addObject: NSLocalizedString( @"Displayed SOP Class UIDs", nil)];
    
	for( NSString *s in [[DCMAbstractSyntaxUID imageSyntaxes] sortedArrayUsingSelector: @selector(compare:)])
		[l addObject: [NSString stringWithFormat: @"%@ - %@", s, [BrowserController compressionString: s]]];
	
	return l;
}

- (NSArray*) ListOfMediaSOPClassUIDStored
{
	NSMutableArray *l = [NSMutableArray array];
	
    [l addObject: NSLocalizedString( @"Stored SOP Class UIDs", nil)];
    
	for( NSString *s in [[DCMAbstractSyntaxUID allSupportedSyntaxes] sortedArrayUsingSelector: @selector(compare:)])
		[l addObject: [NSString stringWithFormat: @"%@ - %@", s, [BrowserController compressionString: s]]];
	
	return l;
}


- (void) dealloc
{	
	NSLog(@"dealloc OSIDatabasePreferencePanePref");
	
    [[NSUserDefaultsController sharedUserDefaultsController] removeObserver: self forKeyPath: @"values.eraseEntireDBAtStartup"];
    [[NSUserDefaultsController sharedUserDefaultsController] removeObserver: self forKeyPath: @"values.dbFontSize"];
	
	[super dealloc];
}

-(void) willUnselect
{
    BOOL recompute = NO;
    
    if( self.newUsePatientBirthDateForUID == NO && self.newUsePatientNameForUID == NO && self.newUsePatientIDForUID == NO)
    {
        NSRunCriticalAlertPanel( NSLocalizedString( @"Patient UID", nil), NSLocalizedString( @"At least one parameter has to be selected to generate a valid Patient UID. Patient ID will be used.", nil), NSLocalizedString( @"OK", nil), nil, nil);
        
        self.newUsePatientIDForUID = YES;
    }
    
    if( self.newUsePatientBirthDateForUID != [[NSUserDefaults standardUserDefaults] boolForKey: @"UsePatientBirthDateForUID"])
        recompute = YES;
    
    if( self.newUsePatientNameForUID != [[NSUserDefaults standardUserDefaults] boolForKey: @"UsePatientNameForUID"])
        recompute = YES;
    
    if( self.newUsePatientIDForUID != [[NSUserDefaults standardUserDefaults] boolForKey: @"UsePatientIDForUID"])
        recompute = YES;
    
    if( recompute)
    {
        [[NSUserDefaults standardUserDefaults] setBool: self.newUsePatientBirthDateForUID forKey: @"UsePatientBirthDateForUID"];
        [[NSUserDefaults standardUserDefaults] setBool: self.newUsePatientNameForUID forKey: @"UsePatientNameForUID"];
        [[NSUserDefaults standardUserDefaults] setBool: self.newUsePatientIDForUID forKey: @"UsePatientIDForUID"];
        
        WaitRendering *wait = [[WaitRendering alloc] init: NSLocalizedString( @"Recomputing Patient UIDs...", nil)];
        [wait showWindow: self];
        [wait start];
        
        [DicomFile setDefaults];
        
        for( DicomDatabase *d in [DicomDatabase allDatabases])
        {
            [DicomDatabase recomputePatientUIDsInContext: d.managedObjectContext];
        }
        
        [[BrowserController currentBrowser] refreshDatabase: self];
        
        [wait end];
        [wait close];
        [wait autorelease];
    }
    
	[[[self mainView] window] makeFirstResponder: nil];
}

- (void) mainViewDidLoad
{
	NSUserDefaults	*defaults = [NSUserDefaults standardUserDefaults];

   long locationValue = [defaults integerForKey:@"DEFAULT_DATABASELOCATION"];
	
	[locationMatrix selectCellWithTag:locationValue];
	[locationPathField setURL: [NSURL fileURLWithPath: [defaults stringForKey:@"DEFAULT_DATABASELOCATIONURL"]]];
	
	[seriesOrderMatrix selectCellWithTag:[defaults integerForKey:@"SERIESORDER"]];
		
	// DATABASE AUTO-CLEANING
	
	[older setState:[defaults boolForKey:@"AUTOCLEANINGDATE"]];
	[deleteOriginal setState:[defaults boolForKey:@"AUTOCLEANINGDELETEORIGINAL"]];
	[[olderType cellWithTag:0] setState:[defaults boolForKey:@"AUTOCLEANINGDATEPRODUCED"]];
	[[olderType cellWithTag:1] setState:[defaults boolForKey:@"AUTOCLEANINGDATEOPENED"]];
	[[olderType cellWithTag:2] setState:[defaults boolForKey:@"AUTOCLEANINGCOMMENTS"]];
	
	[commentsDeleteText setStringValue: [defaults stringForKey:@"AUTOCLEANINGCOMMENTSTEXT"]];
	[commentsDeleteMatrix selectCellWithTag:[[defaults stringForKey:@"AUTOCLEANINGDONTCONTAIN"] intValue]];
	[olderThanProduced selectItemWithTag:[[defaults stringForKey:@"AUTOCLEANINGDATEPRODUCEDDAYS"] intValue]];
	[olderThanOpened selectItemWithTag:[[defaults stringForKey:@"AUTOCLEANINGDATEOPENEDDAYS"] intValue]];    
    
    self.newUsePatientBirthDateForUID = [[NSUserDefaults standardUserDefaults] boolForKey: @"UsePatientBirthDateForUID"];
    self.newUsePatientNameForUID = [[NSUserDefaults standardUserDefaults] boolForKey: @"UsePatientNameForUID"];
    self.newUsePatientIDForUID = [[NSUserDefaults standardUserDefaults] boolForKey: @"UsePatientIDForUID"];
}


- (IBAction)regenerateAutoComments:(id) sender
{
	[[BrowserController currentBrowser] regenerateAutoComments: nil]; // nil == all studies
}

- (IBAction) databaseCleaning:(id)sender
{
	NSUserDefaults	*defaults = [NSUserDefaults standardUserDefaults];

	if( [[olderType cellWithTag:0] state] == NSOffState && [[olderType cellWithTag:1] state] == NSOffState)
	{
		[older setState: NSOffState];
	}
	
	[defaults setBool:[older state] forKey:@"AUTOCLEANINGDATE"];
	[defaults setBool:[deleteOriginal state] forKey:@"AUTOCLEANINGDELETEORIGINAL"];
	
	[defaults setBool:[[olderType cellWithTag:0] state] forKey:@"AUTOCLEANINGDATEPRODUCED"];
	[defaults setBool:[[olderType cellWithTag:1] state] forKey:@"AUTOCLEANINGDATEOPENED"];
	[defaults setBool:[[olderType cellWithTag:2] state] forKey:@"AUTOCLEANINGCOMMENTS"];
	
	[defaults setInteger:[[commentsDeleteMatrix selectedCell] tag] forKey:@"AUTOCLEANINGDONTCONTAIN"];
	[defaults setObject:[commentsDeleteText stringValue] forKey:@"AUTOCLEANINGCOMMENTSTEXT"];
	
	[defaults setInteger:[[olderThanProduced selectedItem] tag] forKey:@"AUTOCLEANINGDATEPRODUCEDDAYS"];
	[defaults setInteger:[[olderThanOpened selectedItem] tag] forKey:@"AUTOCLEANINGDATEOPENEDDAYS"];
}

- (IBAction)setSeriesOrder:(id)sender{
	[[NSUserDefaults standardUserDefaults] setInteger:[(NSMatrix *)[sender selectedCell] tag] forKey:@"SERIESORDER"];
}


- (IBAction)setLocation:(id)sender{
	
	if ([[sender selectedCell] tag] == 1)
	{
		if( [[[NSUserDefaults standardUserDefaults] stringForKey:@"DEFAULT_DATABASELOCATIONURL"] isEqualToString:@""]) [self setLocationURL: self];
		
		if( [[[NSUserDefaults standardUserDefaults] stringForKey:@"DEFAULT_DATABASELOCATIONURL"] isEqualToString:@""] == NO)
		{
			BOOL isDir;
			
			if (![[NSFileManager defaultManager] fileExistsAtPath:[[NSUserDefaults standardUserDefaults] stringForKey:@"DEFAULT_DATABASELOCATIONURL"] isDirectory:&isDir])
			{
				NSRunAlertPanel(@"OsiriX Database Location", @"This location is not valid. Select another location.", @"OK", nil, nil);
				
				[locationMatrix selectCellWithTag:0];
			}
		}
	}
	
	[[NSUserDefaults standardUserDefaults] setInteger:[[sender selectedCell] tag] forKey:@"DEFAULT_DATABASELOCATION"];
	
	[[[[self mainView] window] windowController] reopenDatabase];
	
	[[[self mainView] window] makeKeyAndOrderFront: self];
}

- (IBAction) resetDate:(id) sender
{
	NSDateFormatter	*dateFormat = [[[NSDateFormatter alloc] init] autorelease];
	[dateFormat setDateStyle: NSDateFormatterShortStyle];
	[dateFormat setTimeStyle: NSDateFormatterShortStyle];
	[[NSUserDefaults standardUserDefaults] setObject: [dateFormat dateFormat] forKey:@"DBDateFormat2"];
}

- (IBAction) resetDateOfBirth:(id) sender
{
	NSDateFormatter	*dateFormat = [[[NSDateFormatter alloc] init] autorelease];
	[dateFormat setDateStyle: NSDateFormatterShortStyle];
	[[NSUserDefaults standardUserDefaults] setObject: [dateFormat dateFormat] forKey:@"DBDateOfBirthFormat2"];
}

- (IBAction)setLocationURL:(id)sender{
	//NSLog(@"setLocation URL");
		
	NSOpenPanel         *oPanel = [NSOpenPanel openPanel];
	long				result;
	
    [oPanel setCanChooseFiles:NO];
    [oPanel setCanChooseDirectories:YES];
	
	result = [oPanel runModalForDirectory:0L file:nil types: 0L];
    
    if (result == NSOKButton)
	{
		NSString	*location = [oPanel directory];
		
		if( [[location lastPathComponent] isEqualToString:@"OsiriX OS Data"])
		{
			NSLog( @"%@", [location lastPathComponent]);
			location = [location stringByDeletingLastPathComponent];
		}
		
		if( [[location lastPathComponent] isEqualToString:@"DATABASE"] && [[[location stringByDeletingLastPathComponent] lastPathComponent] isEqualToString:@"OsiriX OS Data"])
		{
			NSLog( @"%@", [location lastPathComponent]);
			location = [[location stringByDeletingLastPathComponent] stringByDeletingLastPathComponent];
		}
		
		[locationPathField setURL: [NSURL fileURLWithPath: location]];
		[[NSUserDefaults standardUserDefaults] setObject:location forKey:@"DEFAULT_DATABASELOCATIONURL"];
		[[NSUserDefaults standardUserDefaults] setInteger:1 forKey:@"DEFAULT_DATABASELOCATION"];
		[locationMatrix selectCellWithTag:1];
	}	
	else 
	{
		[locationPathField setURL: 0L];
		[[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"DEFAULT_DATABASELOCATIONURL"];
		[[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"DEFAULT_DATABASELOCATION"];
		[locationMatrix selectCellWithTag:0];
	}
	
	[[[[self mainView] window] windowController] reopenDatabase];
	
	[[[self mainView] window] makeKeyAndOrderFront: self];
}

- (BOOL)useSeriesDescription{
	return  [[NSUserDefaults standardUserDefaults] boolForKey:@"useSeriesDescription"];
}

- (void)setUseSeriesDescription:(BOOL)value{
	[[NSUserDefaults standardUserDefaults] setBool:value forKey:@"useSeriesDescription"];
}

- (BOOL)splitMultiEchoMR{
	return  [[NSUserDefaults standardUserDefaults] boolForKey:@"splitMultiEchoMR"];
}

- (void)setSplitMultiEchoMR:(BOOL)value{
	[[NSUserDefaults standardUserDefaults] setBool:value forKey:@"splitMultiEchoMR"];
}
//		
//- (BOOL)combineProjectionSeries{
//	return [[NSUserDefaults standardUserDefaults] boolForKey:@"combineProjectionSeries"];
//}
//
//- (void)setCombineProjectionSeries:(BOOL)value{
//	[[NSUserDefaults standardUserDefaults] setBool:value forKey:@"combineProjectionSeries"];
//}

@end
