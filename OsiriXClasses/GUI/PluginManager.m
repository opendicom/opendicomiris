/*=========================================================================
  Program:   OsiriX

  Copyright (c) OsiriX Team
  All rights reserved.
  Distributed under GNU - LGPL
  
  See http://www.osirix-viewer.com/copyright.html for details.

     This software is distributed WITHOUT ANY WARRANTY; without even
     the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
     PURPOSE.
=========================================================================*/


#import "PluginManager.h"
#import "ViewerController.h"
#import "AppController.h"
#import "browserController.h"
#import "BLAuthentication.h"
#import "PluginManagerController.h"
#import "Notifications.h"
#import "NSFileManager+N2.h"
#import "NSMutableDictionary+N2.h"
#import "PreferencesWindowController.h"
#import "N2Debug.h"

static NSMutableDictionary		*plugins = nil;
static NSMutableDictionary    *pluginsDict = nil;
static NSMutableDictionary    *fileFormatPlugins = nil;
static NSMutableDictionary		*reportPlugins = nil;
static NSMutableDictionary    *pluginsBundleDictionnary = nil;

static NSMutableArray			*preProcessPlugins = nil;
static NSMenu					   *fusionPluginsMenu = nil;
static NSMutableArray			*fusionPlugins = nil;
static NSMutableDictionary		*pluginsNames = nil;

BOOL gPluginsAlertAlreadyDisplayed = NO;

@implementation PluginManager

@synthesize downloadQueue;

+ (void) startProtectForCrashWithFilter: (id) filter
{
//    *(long*)0 = 0xDEADBEEF;
    
    for( NSBundle *bundle in [pluginsBundleDictionnary allValues])
    {
        if( [NSStringFromClass( [filter class]) isEqualToString: NSStringFromClass( [bundle principalClass])])
        {
            [PluginManager startProtectForCrashWithPath: [bundle bundlePath]];
           
//            *(long*)0 = 0xDEADBEEF;
            
            return;
        }
    }
    
    NSLog( @"***** unknown plugin - startProtectForCrashWithFilter - %@", NSStringFromClass( [filter principalClass]));
}

+ (void) startProtectForCrashWithPath: (NSString*) path
{
    // Match with AppController, ILCrashReporter
    [path writeToFile: @"/tmp/PluginCrashed" atomically: YES encoding: NSUTF8StringEncoding error: nil];
}

+ (void) endProtectForCrash
{
    // Match with AppController, ILCrashReporter
    [[NSFileManager defaultManager] removeItemAtPath: @"/tmp/PluginCrashed" error: nil];
}

+ (int) compareVersion: (NSString *) v1 withVersion: (NSString *) v2
{
	@try
	{
		NSArray *v1Tokens = [v1 componentsSeparatedByString: @"."];
		NSArray *v2Tokens = [v2 componentsSeparatedByString: @"."];
		int maxLen;
		
		if ( [v1Tokens count] > [v2Tokens count])
			maxLen = [v1Tokens count];
		else
			maxLen = [v2Tokens count];
		
		for (int i = 0; i < maxLen; i++)
		{
			int n1, n2;
			
			n1 = n2 = 0;
			
			if (i < [v1Tokens count])
				n1 = [[v1Tokens objectAtIndex: i] intValue];
			
			if (n1 <= 0)
				[NSException raise: @"compareVersion raised" format: @"compareVersion raised"];
			
			if (i < [v2Tokens count])
				n2 = [[v2Tokens objectAtIndex: i] intValue];
			
			if (n2 <= 0)
				[NSException raise: @"compareVersion raised" format: @"compareVersion raised"];
			
			if (n1 > n2)
				return 1;
			else if (n1 < n2)
				return -1;
		}
		
		return 0;
	}
	@catch (NSException *e)
	{
		return -1;
	}
	return -1;
}

+ (NSMutableDictionary*) plugins
{
	return plugins;
}

+ (NSMutableDictionary*) pluginsDict
{
	return pluginsDict;
}

+ (NSMutableDictionary*) fileFormatPlugins
{
	return fileFormatPlugins;
}

+ (NSMutableDictionary*) reportPlugins
{
	return reportPlugins;
}

+ (NSArray*) preProcessPlugins
{
	return preProcessPlugins;
}

+ (NSMenu*) fusionPluginsMenu
{
	return fusionPluginsMenu;
}

+ (NSArray*) fusionPlugins
{
	return fusionPlugins;
}

#ifdef OSIRIX_VIEWER

+(void)sortMenu:(NSMenu*)menu
{
    // [CH] Get an array of all menu items.
    NSArray* items = [menu itemArray];
    [menu removeAllItems];
    // [CH] Sort the array
    items = [items sortedArrayUsingDescriptors:[NSArray arrayWithObjects:[NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES selector:@selector(localizedCaseInsensitiveCompare:)], nil]];
    // [CH] ok, now set it back.
    for(NSMenuItem* item in items)
    {
        [menu addItem:item];
        /**
         * [CH] The following code fixes NSPopUpButton's confusion that occurs when
         * we sort this list. NSPopUpButton listens to the NSMenu's add notifications
         * and hides the first item. Sorting this blows it up.
         **/
        if(item.isHidden){
            [item setHidden: false];
        }
    }
}

+ (void) setMenus:(NSMenu*) filtersMenu :(NSMenu*) roisMenu :(NSMenu*) othersMenu :(NSMenu*) dbMenu
{
    [filtersMenu removeAllItems];
    [roisMenu removeAllItems];
    [othersMenu removeAllItems];
    [dbMenu removeAllItems];
	
	NSEnumerator *enumerator = [pluginsDict objectEnumerator];
	NSBundle *plugin;
	
	while ((plugin = [enumerator nextObject]))
	{
		NSString	*pluginName = [[plugin infoDictionary] objectForKey:@"CFBundleExecutable"];
		NSString	*pluginType = [[plugin infoDictionary] objectForKey:@"pluginType"];
		NSArray		*menuTitles = [[plugin infoDictionary] objectForKey:@"MenuTitles"];
		
        [PluginManager startProtectForCrashWithPath: [plugin bundlePath]];
        
		if( menuTitles)
		{
			if( [menuTitles count] > 1)
			{
				// Create a sub menu item
				
				NSMenu  *subMenu = [[[NSMenu alloc] initWithTitle: pluginName] autorelease];
				
				for( NSString *menuTitle in menuTitles)
				{
					NSMenuItem *item;
					
					if ([menuTitle isEqual:@"(-"])
					{
						item = [NSMenuItem separatorItem];
					}
					else
					{
						item = [[[NSMenuItem alloc] init] autorelease];
						[item setTitle:menuTitle];
						
						if( [pluginType rangeOfString: @"fusionFilter"].location != NSNotFound)
						{
							[fusionPlugins addObject:[item title]];
							[item setAction:@selector(endBlendingType:)];
						}
						else if( [pluginType rangeOfString: @"Database"].location != NSNotFound || [pluginType rangeOfString: @"Report"].location != NSNotFound)
						{
							[item setTarget: [BrowserController currentBrowser]];	//  browserWindow responds to DB plugins
							[item setAction:@selector(executeFilterDB:)];
						}
						else
						{
							[item setTarget:nil];	// FIRST RESPONDER !
							[item setAction:@selector(executeFilter:)];
						}
 					}
					
					[subMenu insertItem:item atIndex:[subMenu numberOfItems]];
				}
				
				id  subMenuItem;
				
				if( [pluginType rangeOfString: @"imageFilter"].location != NSNotFound)
				{
					if( [filtersMenu indexOfItemWithTitle: pluginName] == -1)
					{
						subMenuItem = [filtersMenu insertItemWithTitle:pluginName action:nil keyEquivalent:@"" atIndex:[filtersMenu numberOfItems]];
						[filtersMenu setSubmenu:subMenu forItem:subMenuItem];
					}
				}
				else if( [pluginType rangeOfString: @"roiTool"].location != NSNotFound)
				{
					if( [roisMenu indexOfItemWithTitle: pluginName] == -1)
					{
						subMenuItem = [roisMenu insertItemWithTitle:pluginName action:nil keyEquivalent:@"" atIndex:[roisMenu numberOfItems]];
						[roisMenu setSubmenu:subMenu forItem:subMenuItem];
					}
				}
				else if( [pluginType rangeOfString: @"fusionFilter"].location != NSNotFound)
				{
					if( [fusionPluginsMenu indexOfItemWithTitle: pluginName] == -1)
					{
						subMenuItem = [fusionPluginsMenu insertItemWithTitle:pluginName action:nil keyEquivalent:@"" atIndex:[fusionPluginsMenu numberOfItems]];
						[fusionPluginsMenu setSubmenu:subMenu forItem:subMenuItem];
					}
				}
				else if( [pluginType rangeOfString: @"Database"].location != NSNotFound)
				{
					if( [dbMenu indexOfItemWithTitle: pluginName] == -1)
					{
						subMenuItem = [dbMenu insertItemWithTitle:pluginName action:nil keyEquivalent:@"" atIndex:[dbMenu numberOfItems]];
						[dbMenu setSubmenu:subMenu forItem:subMenuItem];
					}
				} 
				else
				{
					if( [othersMenu indexOfItemWithTitle: pluginName] == -1)
					{
						subMenuItem = [othersMenu insertItemWithTitle:pluginName action:nil keyEquivalent:@"" atIndex:[othersMenu numberOfItems]];
						[othersMenu setSubmenu:subMenu forItem:subMenuItem];
					}
				}
                
                [subMenuItem setRepresentedObject:plugin];
			}
			else
			{
				// Create a menu item
				
				NSMenuItem *item = [[[NSMenuItem alloc] init] autorelease];
				
				[item setTitle: [menuTitles objectAtIndex: 0]];	//pluginName];
                [item setRepresentedObject:plugin];
				
				if( [pluginType rangeOfString: @"fusionFilter"].location != NSNotFound)
				{
					[fusionPlugins addObject:[item title]];
					[item setAction:@selector(endBlendingType:)];
				}
				else if( [pluginType rangeOfString: @"Database"].location != NSNotFound || [pluginType rangeOfString: @"Report"].location != NSNotFound)
				{
					[item setTarget:[BrowserController currentBrowser]];	//  browserWindow responds to DB plugins
					[item setAction:@selector(executeFilterDB:)];
				}
				else
				{
					[item setTarget:nil];	// FIRST RESPONDER !
					[item setAction:@selector(executeFilter:)];
				}
				
				if( [pluginType rangeOfString: @"imageFilter"].location != NSNotFound)
					[filtersMenu insertItem:item atIndex:[filtersMenu numberOfItems]];
				
				else if( [pluginType rangeOfString: @"roiTool"].location != NSNotFound)
					[roisMenu insertItem:item atIndex:[roisMenu numberOfItems]];
				
				else if( [pluginType rangeOfString: @"fusionFilter"].location != NSNotFound)
					[fusionPluginsMenu insertItem:item atIndex:[fusionPluginsMenu numberOfItems]];
				
				else if( [pluginType rangeOfString: @"Database"].location != NSNotFound)
					[dbMenu insertItem:item atIndex:[dbMenu numberOfItems]];
				
				else
					[othersMenu insertItem:item atIndex:[othersMenu numberOfItems]];
			}
		}
        
        [PluginManager endProtectForCrash];
	}
	
	if( [filtersMenu numberOfItems] < 1)
	{
		NSMenuItem *item = [[[NSMenuItem alloc] init] autorelease];
		[item setTitle:NSLocalizedString(@"No plugins available for this menu", nil)];
		[item setTarget:self];
		
		[filtersMenu insertItem:item atIndex:0];
	}
	
	if( [roisMenu numberOfItems] < 1)
	{
		NSMenuItem *item = [[[NSMenuItem alloc] init] autorelease];
		[item setTitle:NSLocalizedString(@"No plugins available for this menu", nil)];
		[item setTarget:self];
		
		[roisMenu insertItem:item atIndex:0];
	}
	
	if( [othersMenu numberOfItems] < 1)
	{
		NSMenuItem *item = [[[NSMenuItem alloc] init] autorelease];
		[item setTitle:NSLocalizedString(@"No plugins available for this menu", nil)];
		[item setTarget:self];
		
		[othersMenu insertItem:item atIndex:0];
	}
	
	if( [fusionPluginsMenu numberOfItems] <= 1)
	{
		NSMenuItem *item = [[[NSMenuItem alloc] init] autorelease];
		[item setTitle:NSLocalizedString(@"No plugins available for this menu", nil)];
		[item setTarget:self];
		
		[fusionPluginsMenu removeItemAtIndex: 0];
		[fusionPluginsMenu insertItem:item atIndex:0];
	}
	
	if( [dbMenu numberOfItems] < 1)
	{
		NSMenuItem *item = [[[NSMenuItem alloc] init] autorelease];
		[item setTitle:NSLocalizedString(@"No plugins available for this menu", nil)];
		[item setTarget:self];
		
		[dbMenu insertItem:item atIndex:0];
	}
	
    [PluginManager sortMenu: dbMenu];
    [PluginManager sortMenu: roisMenu];
    [PluginManager sortMenu: filtersMenu];
    [PluginManager sortMenu: othersMenu];
    
	NSEnumerator *pluginEnum = [plugins objectEnumerator];
	PluginFilter *pluginFilter;
	
	while( pluginFilter = [pluginEnum nextObject])
    {
        [PluginManager startProtectForCrashWithFilter: pluginFilter];
        
        @try
        {
            [pluginFilter setMenus];
        }
        @catch (NSException *e)
        {
            NSLog( @"***** exception in %s: %@", __PRETTY_FUNCTION__, e);
        }
        
        [PluginManager endProtectForCrash];
	}
}

- (void)initiate
{
   pluginsBundleDictionnary = [[NSMutableDictionary alloc] init];
   plugins = [[NSMutableDictionary alloc] init];
   pluginsDict = [[NSMutableDictionary alloc] init];
   fileFormatPlugins = [[NSMutableDictionary alloc] init];
   preProcessPlugins = [[NSMutableArray alloc] initWithCapacity:0];
   reportPlugins = [[NSMutableDictionary alloc] init];
   pluginsNames = [[NSMutableDictionary alloc] init];
   fusionPlugins = [[NSMutableArray alloc] initWithCapacity:0];
}
- (id)init
{
	if (self = [super init])
	{
		// Set DefaultROINames *before* initializing plugins (which may change these)
		
		NSMutableArray *defaultROINames = [NSMutableArray array];
		
		[defaultROINames addObject:@"ROI 1"];
		[defaultROINames addObject:@"ROI 2"];
		[defaultROINames addObject:@"ROI 3"];
		[defaultROINames addObject:@"ROI 4"];
		[defaultROINames addObject:@"ROI 5"];
		
		[ViewerController setDefaultROINames: defaultROINames];
		
      @try
      {
         fusionPluginsMenu = [[NSMenu alloc] initWithTitle:@""];
         [fusionPluginsMenu insertItemWithTitle:NSLocalizedString(@"Select a fusion plug-in", nil) action:nil keyEquivalent:@"" atIndex:0];
         
         NSLog( @"|||||||||||||||||| Plugins loading START ||||||||||||||||||");
         
         
         NSFileManager *defaultManager=[NSFileManager defaultManager];
         
         NSString   *appPath = [[NSBundle mainBundle] builtInPlugInsPath];
         if (![defaultManager fileExistsAtPath:appPath])
            [defaultManager createDirectoryAtURL:[NSURL URLWithString:appPath]
                     withIntermediateDirectories:YES
                                      attributes:nil
                                           error:nil
             ];
         
         NSString   *userPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Application Support/opendicomiris/Plugins/"];
         if (![defaultManager fileExistsAtPath:userPath])
            [defaultManager createDirectoryAtURL:[NSURL URLWithString:userPath]
                     withIntermediateDirectories:YES
                                      attributes:nil
                                           error:nil
             ];
         
         
         NSMutableArray* pathsOfPluginsToLoad = [NSMutableArray array];
         for (id path in @[appPath, userPath])
         {
            NSArray* pluginsInDir = [defaultManager directoryContentsAtPath:path];
            for (NSString *name in pluginsInDir)
            {
               [pathsOfPluginsToLoad addObject:[defaultManager destinationOfAliasOrSymlinkAtPath:[path stringByAppendingPathComponent: name]]];
               
#pragma mark TODO requirements...
               /*
                some plugins require other plugins to be loaded before them
                
                NSBundle* bundle = [NSBundle bundleWithPath:[pathsOfPluginsToLoad objectAtIndex:i]];
                NSString* name = [bundle.infoDictionary objectForKey:@"CFBundleName"];
                if (!name) name = [[[pathsOfPluginsToLoad objectAtIndex:i] lastPathComponent] stringByDeletingPathExtension];
                for (NSString* req in [bundle.infoDictionary objectForKey:@"Requirements"]) {

                */
            }
         }
         
         
         for (id path in pathsOfPluginsToLoad)
            [PluginManager loadPluginAtPath:path];

         
         NSLog( @"|||||||||||||||||| Plugins loading END ||||||||||||||||||");
      }
      @catch (NSException * e)
      {
         N2LogExceptionWithStackTrace(e);
      }
	}
	return self;
}

+ (NSString*) pathResolved:(NSString*) inPath
{
	CFStringRef resolvedPath = nil;
	CFURLRef	url = CFURLCreateWithFileSystemPath(NULL /*allocator*/, (CFStringRef)inPath, kCFURLPOSIXPathStyle, NO /*isDirectory*/);
	if (url != NULL)
    {
		FSRef fsRef;
		if (CFURLGetFSRef(url, &fsRef))
        {
			Boolean targetIsFolder, wasAliased;
			if (FSResolveAliasFile (&fsRef, true /*resolveAliasChains*/, &targetIsFolder, &wasAliased) == noErr && wasAliased)
            {
				CFURLRef resolvedurl = CFURLCreateFromFSRef(NULL /*allocator*/, &fsRef);
				if (resolvedurl != NULL)
                {
					resolvedPath = CFURLCopyFileSystemPath(resolvedurl, kCFURLPOSIXPathStyle);
					CFRelease(resolvedurl);
				}
			}
		}
		CFRelease(url);
	}
	
	if( resolvedPath == nil) return inPath;
	else return [(NSString *) resolvedPath autorelease];
}

+ (void) releaseInstanciedObjectsOfClass: (Class) class
{
    for( int i = 0; i < [preProcessPlugins count]; i++)
    {
        if( [[preProcessPlugins objectAtIndex: i] class] == class)
        {
            NSObject *filter = [preProcessPlugins objectAtIndex: i];
            
            if( [filter respondsToSelector: @selector(willUnload)])
                [filter performSelector: @selector(willUnload)];
            
            [preProcessPlugins removeObjectAtIndex: i];
            i--;
        }
    }
    
    for( NSString *key in [plugins allKeys])
    {
        if( [[plugins valueForKey: key] class] == class)
        {
            NSObject *filter = [plugins valueForKey: key];
            
            if( [filter respondsToSelector: @selector(willUnload)])
                [filter performSelector: @selector(willUnload)];
            
            [plugins removeObjectForKey: key];
        }
    }
}


+ (void) loadPluginAtPath: (NSString*) path
{
    NSString *name = [path lastPathComponent];
    
    path = [path stringByDeletingLastPathComponent];
    
    if (([[name pathExtension] isEqualToString:@"plugin"] || [[name pathExtension] isEqualToString:@"osirixplugin"]))
    {
        if( [pluginsNames valueForKey: [[name lastPathComponent] stringByDeletingPathExtension]])
        {
            NSLog( @"***** Multiple plugins: %@", [name lastPathComponent]);
            
            if( [name.lastPathComponent isEqualToString: @"UserManual.osirixplugin"] == NO)
            {
                NSString *message = NSLocalizedString(@"Warning! Multiple instances of the same plugin have been found. Only one instance will be loaded. Check the Plugin Manager (Plugins menu) for multiple identical plugins.", nil);
                
                message = [message stringByAppendingFormat:@"\r\r%@", [name lastPathComponent]];
                
                NSRunAlertPanel( NSLocalizedString(@"Plugins", nil), @"%@" , nil, nil, nil, message);
            }
        }
        else
        {
            [pluginsNames setValue: path forKey: [[name lastPathComponent] stringByDeletingPathExtension]];
            
            @try
            {
                NSString *pathResolved = [PluginManager pathResolved: [path stringByAppendingPathComponent: name]];
                
                [PluginManager startProtectForCrashWithPath: pathResolved];
                
                NSBundle *plugin = [NSBundle bundleWithPath: pathResolved];
                
                if( plugin == nil)
                    NSLog( @"**** Bundle opening failed for plugin: %@", [path stringByAppendingPathComponent:name]);
                else
                {
                    if (![plugin load])
                    {
                        NSLog( @"******* Bundle code loading failed for plugin %@", [path stringByAppendingPathComponent:name]);
                    }
                    else
                    {
                        Class filterClass = [plugin principalClass];
                        
                        if( filterClass)
                        {
                            [pluginsBundleDictionnary setObject: plugin forKey: pathResolved];
                            
                            NSString *version = [[plugin infoDictionary] valueForKey: (NSString*) kCFBundleVersionKey];
                            
                            if( version == nil)
                                version = [[plugin infoDictionary] valueForKey: @"CFBundleShortVersionString"];
                            
                            NSLog( @"Loaded: %@, vers: %@ (%@)", [name stringByDeletingPathExtension], version, path);
                            
                            if( filterClass == NSClassFromString( @"ARGS")) return;
                            
                            if ([[[plugin infoDictionary] objectForKey:@"pluginType"] rangeOfString:@"Pre-Process"].location != NSNotFound) 
                            {
                                PluginFilter *filter = [filterClass filter];
                                [preProcessPlugins addObject: filter];
                            }
                            else if ([[plugin infoDictionary] objectForKey:@"FileFormats"]) 
                            {
                                NSEnumerator *enumerator = [[[plugin infoDictionary] objectForKey:@"FileFormats"] objectEnumerator];
                                NSString *fileFormat;
                                while (fileFormat = [enumerator nextObject])
                                {
                                    //we will save the bundle rather than a filter.  Each file decode will require a separate decoder
                                    [fileFormatPlugins setObject:plugin forKey:fileFormat];
                                }
                            }
                            else if ( [filterClass instancesRespondToSelector:@selector(filterImage:)])
                            {
                                NSArray *menuTitles = [[plugin infoDictionary] objectForKey:@"MenuTitles"];
                                PluginFilter *filter = [filterClass filter];
                                
                                if( menuTitles)
                                {
                                    for( NSString *menuTitle in menuTitles)
                                    {
                                        [plugins setObject:filter forKey:menuTitle];
                                        [pluginsDict setObject:plugin forKey:menuTitle];
                                    }
                                }
                                
                                NSArray *toolbarNames = [[plugin infoDictionary] objectForKey:@"ToolbarNames"];
                                
                                if( toolbarNames)
                                {
                                    for( NSString *toolbarName in toolbarNames)
                                    {
                                        [plugins setObject:filter forKey:toolbarName];
                                        [pluginsDict setObject:plugin forKey:toolbarName];
                                    }
                                }
                            }
                            
                            if ([[[plugin infoDictionary] objectForKey:@"pluginType"] rangeOfString: @"Report"].location != NSNotFound) 
                            {
                                [reportPlugins setObject: plugin forKey:[[plugin infoDictionary] objectForKey:@"CFBundleExecutable"]];
                            }
                        }
                        else NSLog( @"********* principal class not found for: %@ - %@", name, [plugin principalClass]);
                    }
                }
                
                [PluginManager endProtectForCrash];
            }
            @catch( NSException *e)
            {
                NSLog( @"******** Plugin loading exception: %@", e);
            }
        }
    }
}


#pragma mark -
#pragma mark Plugin user management

#pragma mark directories

+ (NSString*)activePluginsDirectoryPath;
{
    #ifdef MACAPPSTORE
	return @"Library/Application Support/OsiriX App/Plugins/";
    #else
    return @"Library/Application Support/OsiriX/Plugins/";
    #endif
}

+ (NSString*)inactivePluginsDirectoryPath;
{
    #ifdef MACAPPSTORE
	return @"Library/Application Support/OsiriX App/Plugins Disabled/";
    #else
    return @"Library/Application Support/OsiriX/Plugins Disabled/";
    #endif
}

+ (NSString*)userActivePluginsDirectoryPath;
{
	return [NSHomeDirectory() stringByAppendingPathComponent:[PluginManager activePluginsDirectoryPath]];
}

+ (NSString*)userInactivePluginsDirectoryPath;
{
	return [NSHomeDirectory() stringByAppendingPathComponent:[PluginManager inactivePluginsDirectoryPath]];
}

+ (NSString*)systemActivePluginsDirectoryPath;
{
	NSString *s = @"/";
	return [s stringByAppendingPathComponent:[PluginManager activePluginsDirectoryPath]];
}

+ (NSString*)systemInactivePluginsDirectoryPath;
{
	NSString *s = @"/";
	return [s stringByAppendingPathComponent:[PluginManager inactivePluginsDirectoryPath]];
}

+ (NSString*)appActivePluginsDirectoryPath;
{
	return [[NSBundle mainBundle] builtInPlugInsPath];
}

+ (NSString*)appInactivePluginsDirectoryPath;
{
	NSMutableString *appPath = [NSMutableString stringWithString:[[NSBundle mainBundle] builtInPlugInsPath]];
	[appPath appendString:@" Disabled"];
	return appPath;
}

+ (NSArray*)activeDirectories;
{
	return [NSArray arrayWithObjects:[PluginManager userActivePluginsDirectoryPath], [PluginManager systemActivePluginsDirectoryPath], [PluginManager appActivePluginsDirectoryPath], nil];
}

+ (NSArray*)inactiveDirectories;
{
	return [NSArray arrayWithObjects:[PluginManager userInactivePluginsDirectoryPath], [PluginManager systemInactivePluginsDirectoryPath], [PluginManager appInactivePluginsDirectoryPath], nil];
}

#pragma mark activation


+ (void)movePluginFromPath:(NSString*)sourcePath toPath:(NSString*)destinationPath;
{
	if([sourcePath isEqualToString:destinationPath]) return;
	
	if(![[NSFileManager defaultManager] fileExistsAtPath:[destinationPath stringByDeletingLastPathComponent]])
		[[NSFileManager defaultManager] createDirectoryAtPath:[destinationPath stringByDeletingLastPathComponent] attributes:nil];

    NSMutableArray *args = [NSMutableArray array];
	[args addObject:@"-f"];
    [args addObject:sourcePath];
    [args addObject:destinationPath];

	[[BLAuthentication sharedInstance] executeCommand:@"/bin/mv" withArgs:args];
    
    if( [[NSFileManager defaultManager] fileExistsAtPath: destinationPath] == NO)
    {
        NSMutableArray *args = [NSMutableArray array];
        [args addObject:@"-f"];
        [args addObject:@"-R"];
        [args addObject:sourcePath];
        [args addObject:destinationPath];
        
        [[BLAuthentication sharedInstance] executeCommand:@"/bin/cp" withArgs:args];
    }
}

+ (void)activatePluginWithName:(NSString*)pluginName;
{
	NSMutableArray *activePaths = [NSMutableArray arrayWithArray:[PluginManager activeDirectories]];
	NSMutableArray *inactivePaths = [NSMutableArray arrayWithArray:[PluginManager inactiveDirectories]];
	
	NSEnumerator *activePathEnum = [activePaths objectEnumerator];
    NSString *activePath;
    NSString *inactivePath;
    
	for(inactivePath in inactivePaths)
	{
		activePath = [activePathEnum nextObject];
		NSEnumerator *e = [[[NSFileManager defaultManager] directoryContentsAtPath:inactivePath] objectEnumerator];
		NSString *name;
		while(name = [e nextObject])
		{
			if([[name stringByDeletingPathExtension] isEqualToString:pluginName])
			{
				NSString *sourcePath = [NSString stringWithFormat:@"%@/%@", inactivePath, name];
				NSString *destinationPath = [NSString stringWithFormat:@"%@/%@", activePath, name];
				[PluginManager movePluginFromPath:sourcePath toPath:destinationPath];
			}
		}
	}
    
    if( !gPluginsAlertAlreadyDisplayed)
        NSRunInformationalAlertPanel(NSLocalizedString(@"Plugins", @""), NSLocalizedString( @"Restart OsiriX to apply the changes to the plugins.", @""), NSLocalizedString(@"OK", @""), nil, nil);
    gPluginsAlertAlreadyDisplayed = YES;
}

+ (void)deactivatePluginWithName:(NSString*)pluginName;
{
	NSMutableArray *activePaths = [NSMutableArray arrayWithArray:[PluginManager activeDirectories]];
	NSMutableArray *inactivePaths = [NSMutableArray arrayWithArray:[PluginManager inactiveDirectories]];
	
    NSString *activePath;
	NSEnumerator *inactivePathEnum = [inactivePaths objectEnumerator];
    NSString *inactivePath;
	
	for(activePath in activePaths)
	{
		inactivePath = [inactivePathEnum nextObject];
		NSEnumerator *e = [[[NSFileManager defaultManager] directoryContentsAtPath:activePath] objectEnumerator];
		NSString *name;
		while(name = [e nextObject])
		{
			if([[name stringByDeletingPathExtension] isEqualToString:pluginName])
			{
				BOOL isDir = YES;
				if (![[NSFileManager defaultManager] fileExistsAtPath:inactivePath isDirectory:&isDir] && isDir)
					[PluginManager createDirectory:inactivePath];
				//	[[NSFileManager defaultManager] createDirectoryAtPath:inactivePath attributes:nil];
				NSString *sourcePath = [NSString stringWithFormat:@"%@/%@", activePath, name];
				NSString *destinationPath = [NSString stringWithFormat:@"%@/%@", inactivePath, name];
				[PluginManager movePluginFromPath:sourcePath toPath:destinationPath];
			}
		}
	}
    
    if( !gPluginsAlertAlreadyDisplayed)
        NSRunInformationalAlertPanel(NSLocalizedString(@"Plugins", @""), NSLocalizedString( @"Restart OsiriX to apply the changes to the plugins.", @""), NSLocalizedString(@"OK", @""), nil, nil);
    gPluginsAlertAlreadyDisplayed = YES;
}

+ (void)changeAvailabilityOfPluginWithName:(NSString*)pluginName to:(NSString*)availability;
{
    NSArray *availabilities = [PluginManager availabilities];
    
#ifdef MACAPPSTORE
    if([availability isEqualTo:[availabilities objectAtIndex:0]] == NO)
    {
        NSRunCriticalAlertPanel( NSLocalizedString(@"Plugin",nil),  NSLocalizedString( @"You cannot move the plugin to another location with this version of OsiriX.", nil), NSLocalizedString(@"OK",nil), nil, nil);
    }
#endif
    
	NSMutableArray *paths = [NSMutableArray array];
	[paths addObjectsFromArray:[PluginManager activeDirectories]];
	[paths addObjectsFromArray:[PluginManager inactiveDirectories]];

	NSEnumerator *pathEnum = [paths objectEnumerator];
    NSString *path;
	NSString *completePluginPath = nil;
	BOOL found = NO;
	
	while((path = [pathEnum nextObject]) && !found)
	{
		NSEnumerator *e = [[[NSFileManager defaultManager] directoryContentsAtPath:path] objectEnumerator];
		NSString *name;
		while((name = [e nextObject]) && !found)
		{
			if([[name stringByDeletingPathExtension] isEqualToString:pluginName])
			{
				completePluginPath = [NSString stringWithFormat:@"%@/%@", path, name];
				found = YES;
			}
		}
	}
	
	NSString *directory = [completePluginPath stringByDeletingLastPathComponent];
	NSMutableString *newDirectory = [NSMutableString stringWithString:@""];
	
	
	if([availability isEqualTo:[availabilities objectAtIndex:0]])
	{
		[newDirectory setString:[PluginManager userActivePluginsDirectoryPath]];
	}
	else if(availabilities.count >= 1 && [availability isEqualTo:[availabilities objectAtIndex:1]])
	{
		[newDirectory setString:[PluginManager systemActivePluginsDirectoryPath]];
	}
	else if(availabilities.count >= 2 && [availability isEqualTo:[availabilities objectAtIndex:2]])
	{
		[newDirectory setString:[PluginManager appActivePluginsDirectoryPath]];
	}
	[newDirectory setString:[newDirectory stringByDeletingLastPathComponent]]; // remove /Plugins/
	[newDirectory setString:[newDirectory stringByAppendingPathComponent:[directory lastPathComponent]]]; // add /Plugins/ or /Plugins (off)/
	
	NSMutableString *newPluginPath = [NSMutableString stringWithString:@""];
	[newPluginPath setString:[newDirectory stringByAppendingPathComponent:[completePluginPath lastPathComponent]]];
	
	[PluginManager movePluginFromPath:completePluginPath toPath:newPluginPath];
}

+ (void)createDirectory:(NSString*)directoryPath;
{
	BOOL isDir = YES;
	BOOL directoryCreated = NO;
	if (![[NSFileManager defaultManager] fileExistsAtPath:directoryPath isDirectory:&isDir] && isDir)
		directoryCreated = [[NSFileManager defaultManager] createDirectoryAtPath:directoryPath attributes:nil];

	if(!directoryCreated)
	{
	    NSMutableArray *args = [NSMutableArray array];
		[args addObject:directoryPath];
		[[BLAuthentication sharedInstance] executeCommand:@"/bin/mkdir" withArgs:args];
	}
}

#pragma mark Instalation

+ (void) installPluginFromPath: (NSString*) path
{
    // move the plugin package into the plugins (active) directory
    NSString *destinationDirectory = nil;
    NSString *destinationPath = nil;
    
    NSMutableDictionary *active = [NSMutableDictionary dictionary];
	NSMutableDictionary *availabilities = [NSMutableDictionary dictionary];
	
    NSString *pluginBundleName = [[path lastPathComponent] stringByDeletingPathExtension];
    
    for(NSDictionary *plug in [PluginManager pluginsList])
    {
        if([pluginBundleName isEqualToString: [plug objectForKey:@"name"]])
        {
            [availabilities setObject: [plug objectForKey:@"availability"] forKey:path];
            [active setObject: [plug objectForKey:@"active"] forKey:path];
        }
    }
    
    NSString *availability = [availabilities objectForKey: path];
    BOOL isActive = [[active objectForKey:path] boolValue];
    
    if(!availability)
        isActive = YES;
    
    if([availability isEqualToString:[[PluginManager availabilities] objectAtIndex:0]])
    {
        if(isActive)
            destinationDirectory = [PluginManager userActivePluginsDirectoryPath];
        else
            destinationDirectory = [PluginManager userInactivePluginsDirectoryPath];
    }
#ifndef MACAPPSTORE
    else if([availability isEqualToString:[[PluginManager availabilities] objectAtIndex:1]])
    {
        if(isActive)
            destinationDirectory = [PluginManager systemActivePluginsDirectoryPath];
        else
            destinationDirectory = [PluginManager systemInactivePluginsDirectoryPath];
    }
    else if([availability isEqualToString:[[PluginManager availabilities] objectAtIndex:2]])
    {
        if(isActive)
            destinationDirectory = [PluginManager appActivePluginsDirectoryPath];
        else
            destinationDirectory = [PluginManager appInactivePluginsDirectoryPath];
    }
    else
#endif
    {
        if(isActive)
            destinationDirectory = [PluginManager userActivePluginsDirectoryPath];
        else
            destinationDirectory = [PluginManager userInactivePluginsDirectoryPath];
    }
    
    destinationPath = [destinationDirectory stringByAppendingPathComponent: [path lastPathComponent]];
    
    // delete the plugin if it already exists.
    [PluginManager deletePluginWithName: [path lastPathComponent]];
    
    // move the new plugin to the plugin folder				
    [PluginManager movePluginFromPath: path toPath: destinationPath];
    
//    // load the plugin - The User has to restart
//    [PluginManager loadPluginAtPath: destinationPath];
}

#pragma mark Deletion

+ (NSString*) deletePluginWithName:(NSString*)pluginName;
{
	return [PluginManager deletePluginWithName: pluginName availability: nil isActive: YES];
}

+ (NSString*) deletePluginWithName:(NSString*)pluginName availability: (NSString*) availability isActive:(BOOL) isActive
{
   pluginName = [pluginName stringByDeletingPathExtension];
   
	NSMutableArray *pluginsPaths = [NSMutableArray arrayWithArray:[PluginManager activeDirectories]];
	[pluginsPaths addObjectsFromArray:[PluginManager inactiveDirectories]];
	
    NSString *path, *returnPath = nil;
	NSString *trashDir = [NSHomeDirectory() stringByAppendingPathComponent:@".Trash"];
	
	NSString *directory = nil;
	NSArray *availabilities = [PluginManager availabilities];
	if( [availability isEqualToString:[availabilities objectAtIndex:0]])
	{
		if( isActive)
			directory = [PluginManager userActivePluginsDirectoryPath];
		else
			directory = [PluginManager userInactivePluginsDirectoryPath];
	}
	else if( availabilities.count >= 1 && [availability isEqualToString:[availabilities objectAtIndex:1]])
	{
		if(isActive)
			directory = [PluginManager systemActivePluginsDirectoryPath];
		else
			directory = [PluginManager systemInactivePluginsDirectoryPath];
	}
	else if( availabilities.count >= 2 && [availability isEqualToString:[availabilities objectAtIndex:2]])
	{
		if(isActive)
			directory = [PluginManager appActivePluginsDirectoryPath];
		else
			directory = [PluginManager appInactivePluginsDirectoryPath];
	}
	
	for(path in pluginsPaths)
	{
		NSEnumerator *e = [[[NSFileManager defaultManager] directoryContentsAtPath:path] objectEnumerator];
		NSString *name;
		while(name = [e nextObject])
		{
			if([[name stringByDeletingPathExtension] isEqualToString: [pluginName stringByDeletingPathExtension]] && (directory == nil || [directory isEqualTo: path]))
			{
				NSInteger tag = 0;
				[[NSWorkspace sharedWorkspace] performFileOperation:NSWorkspaceRecycleOperation source:path destination:trashDir files:[NSArray arrayWithObject:name] tag:&tag];
				if(tag!=0)
				{
					NSLog( @"performFileOperation:NSWorkspaceRecycleOperation failed, will us mv");
					
					NSMutableArray *args = [NSMutableArray array];
					[args addObject:@"-f"];
					[args addObject:[NSString stringWithFormat:@"%@/%@", path, name]];
					[args addObject:[NSString stringWithFormat:@"%@/%@", trashDir, name]];
					[[BLAuthentication sharedInstance] executeCommand:@"/bin/mv" withArgs:args];

				}
				
				returnPath = path;
				
//				// delete
//				BOOL deleted = [[NSFileManager defaultManager] removeFileAtPath:[NSString stringWithFormat:@"%@/%@", path, name] handler:nil];
//				if(!deleted)
//				{
//					NSMutableArray *args = [NSMutableArray array];
//					[args addObject:@"-r"];
//					[args addObject:[NSString stringWithFormat:@"%@/%@", path, name]];
//					[[BLAuthentication sharedInstance] executeCommand:@"/bin/rm" withArgs:args];
//				}
			}
		}
	}
	
    if( !gPluginsAlertAlreadyDisplayed)
        NSRunInformationalAlertPanel(NSLocalizedString(@"Plugins", @""), NSLocalizedString( @"Restart OsiriX to apply the changes to the plugins.", @""), NSLocalizedString(@"OK", @""), nil, nil);
    gPluginsAlertAlreadyDisplayed = YES;
    
	return returnPath;
}

#pragma mark plugins

NSInteger sortPluginArray(id plugin1, id plugin2, void *context)
{
    NSString *name1 = [plugin1 objectForKey:@"name"];
    NSString *name2 = [plugin2 objectForKey:@"name"];
    
	return [name1 compare:name2 options: NSCaseInsensitiveSearch];
}

+ (NSArray*)pluginsList;
{
	NSString *userActivePath = [PluginManager userActivePluginsDirectoryPath];
	NSString *userInactivePath = [PluginManager userInactivePluginsDirectoryPath];
	NSString *sysActivePath = [PluginManager systemActivePluginsDirectoryPath];
	NSString *sysInactivePath = [PluginManager systemInactivePluginsDirectoryPath];

//	NSArray *paths = [NSArray arrayWithObjects:userActivePath, userInactivePath, sysActivePath, sysInactivePath, nil];
	
	NSMutableArray *paths = [NSMutableArray array];
	[paths addObjectsFromArray:[PluginManager activeDirectories]];
	[paths addObjectsFromArray:[PluginManager inactiveDirectories]];
    
    NSString *path;
	
    NSMutableArray *plugins = [NSMutableArray array];
	
    for(path in paths)
	{
//		BOOL active = ([path isEqualToString:userActivePath] || [path isEqualToString:sysActivePath]);
//		BOOL allUsers = ([path isEqualToString:sysActivePath] || [path isEqualToString:sysInactivePath]);
		BOOL active = [[PluginManager activeDirectories] containsObject:path];
		BOOL allUsers = ([path isEqualToString:sysActivePath] || [path isEqualToString:sysInactivePath] || [path isEqualToString:[PluginManager appActivePluginsDirectoryPath]] || [path isEqualToString:[PluginManager appInactivePluginsDirectoryPath]]);
		
		NSString *availability = nil;
		if([path isEqualToString:sysActivePath] || [path isEqualToString:sysInactivePath])
			availability = [[PluginManager availabilities] objectAtIndex:1];
		else if([path isEqualToString:[PluginManager appActivePluginsDirectoryPath]] || [path isEqualToString:[PluginManager appInactivePluginsDirectoryPath]])
			availability = [[PluginManager availabilities] objectAtIndex:2];
		else if([path isEqualToString:userActivePath] || [path isEqualToString:userInactivePath])
			availability = [[PluginManager availabilities] objectAtIndex:0];
		
		NSEnumerator *e = [[[NSFileManager defaultManager] directoryContentsAtPath:path] objectEnumerator];
		NSString *name;
		while(name = [e nextObject])
		{
			if([[name pathExtension] isEqualToString:@"plugin"] || [[name pathExtension] isEqualToString:@"osirixplugin"])
			{
//				NSBundle *plugin = [NSBundle bundleWithPath:[PluginManager pathResolved:[path stringByAppendingPathComponent:name]]];
//				if (filterClass = [plugin principalClass])	
				{					
					NSMutableDictionary *pluginDescription = [NSMutableDictionary dictionaryWithCapacity:3];
					[pluginDescription setObject:[name stringByDeletingPathExtension] forKey:@"name"];
					[pluginDescription setObject:[NSNumber numberWithBool:active] forKey:@"active"];
					[pluginDescription setObject:[NSNumber numberWithBool:allUsers] forKey:@"allUsers"];
						
					[pluginDescription setObject:availability forKey:@"availability"];
					
					// plugin version
					
					// taking the "version" through NSBundle is a BAD idea: Cocoa keeps the NSBundle in cache... thus for a same path you'll always have the same version
					
					NSURL *bundleURL = [NSURL fileURLWithPath:[PluginManager pathResolved:[path stringByAppendingPathComponent:name]]];
					CFDictionaryRef bundleInfoDict = CFBundleCopyInfoDictionaryInDirectory((CFURLRef)bundleURL);
								
					CFStringRef versionString = nil;
					if(bundleInfoDict != NULL)
					{
						versionString = CFDictionaryGetValue(bundleInfoDict, CFSTR("CFBundleVersion"));
					
						if(versionString == nil)
							versionString = CFDictionaryGetValue(bundleInfoDict, CFSTR("CFBundleShortVersionString"));
					}
					
					NSString *pluginVersion;
					if(versionString != NULL)
						pluginVersion = (NSString*)versionString;
					else
						pluginVersion = @"";
						
					[pluginDescription setObject:pluginVersion forKey:@"version"];
					
					if(bundleInfoDict != NULL)
						CFRelease( bundleInfoDict);
					
					// plugin description dictionary
					[plugins addObject:pluginDescription];
				}
			}
		}
	}
	NSArray *sortedPlugins = [plugins sortedArrayUsingFunction:sortPluginArray context:NULL];
	return sortedPlugins;
}

+ (NSArray*)availabilities;
{
	return [NSArray arrayWithObjects:NSLocalizedString(@"Current user", nil), NSLocalizedString(@"All users", nil), NSLocalizedString(@"OsiriX bundle", nil), nil];
}


#pragma mark -
#pragma mark auto update


#endif

@end
