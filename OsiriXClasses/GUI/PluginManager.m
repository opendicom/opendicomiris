#import "PluginManager.h"
#import "AppController.h"
#import "browserController.h"
#import "NSFileManager+N2.h"
#import "N2Debug.h"

static NSMutableDictionary		*plugins = nil;
static NSMutableDictionary    *pluginBundles = nil;
static NSMutableDictionary    *fileFormatPlugins = nil;
static NSMutableDictionary		*reportPlugins = nil;
static NSMutableDictionary    *pluginsBundleDictionnary = nil;

static NSMutableArray			*preProcessPlugins = nil;
static NSMenu					   *fusionPluginsMenu = nil;
static NSMutableArray			*fusionPlugins = nil;

@implementation PluginManager

#pragma mark - properties

+(NSMutableDictionary*)plugins
{
   return plugins;
}

+(NSMutableDictionary*)pluginBundles
{
   return pluginBundles;
}

+(NSMutableDictionary*)fileFormatPlugins
{
   return fileFormatPlugins;
}

+(NSMutableDictionary*)reportPlugins
{
   return reportPlugins;
}

+(NSArray*)preProcessPlugins
{
   return preProcessPlugins;
}

+(NSMenu*)fusionPluginsMenu
{
   return fusionPluginsMenu;
}

+(NSArray*)fusionPlugins
{
   return fusionPlugins;
}

#pragma mark -

-(void)initiate
{

}
-(id)init
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
      
      fusionPluginsMenu = [[NSMenu alloc] initWithTitle:@""];
      [fusionPluginsMenu insertItemWithTitle:NSLocalizedString(@"Select a fusion plug-in", nil) action:nil keyEquivalent:@"" atIndex:0];

      pluginsBundleDictionnary=[[NSMutableDictionary dictionary]retain];
      plugins=[[NSMutableDictionary dictionary]retain];
      pluginBundles=[[NSMutableDictionary dictionary]retain];
      fileFormatPlugins=[[NSMutableDictionary dictionary]retain];
      preProcessPlugins=[[NSMutableArray array]retain];
      reportPlugins=[[NSMutableDictionary dictionary]retain];
      fusionPlugins=[[NSMutableArray array]retain];

      @try
      {
         NSLog( @"|||||||||||||||||| PlugIns loading START ||||||||||||||||||");
         
         
         NSFileManager *defaultManager=[NSFileManager defaultManager];
         
         NSString   *appPath = [[NSBundle mainBundle] builtInPlugInsPath];
         if (![defaultManager fileExistsAtPath:appPath])
            [defaultManager createDirectoryAtURL:[NSURL URLWithString:appPath]
                     withIntermediateDirectories:YES
                                      attributes:nil
                                           error:nil
             ];
         
         NSString   *userPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Application Support/opendicomiris/PlugIns/"];
         if (![defaultManager fileExistsAtPath:userPath])
            [defaultManager createDirectoryAtURL:[NSURL URLWithString:userPath]
                     withIntermediateDirectories:YES
                                      attributes:nil
                                           error:nil
             ];
         
         
         NSMutableSet* pathsOfPluginsToLoad = [NSMutableSet set];


         for (id path in @[appPath, userPath])
         {
            NSArray* pluginsInDir = [defaultManager directoryContentsAtPath:path];
            for (NSString *name in pluginsInDir)
            {
               if (  [[name pathExtension] isEqualToString:@"plugin"]
                   ||[[name pathExtension] isEqualToString:@"osirixplugin"]
                     )
               {
                  NSString* bundlePath=[defaultManager destinationOfAliasOrSymlinkAtPath:[path stringByAppendingPathComponent: name]];
                  NSLog(@"%@ -> %@",name,bundlePath);
                  [pathsOfPluginsToLoad addObject:bundlePath];
               }
               
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
         {
            NSString *name = [path lastPathComponent];
            
            @try
            {
               [PluginManager startProtectForCrashWithPath: path];
               
               NSBundle *bundle = [NSBundle bundleWithPath: path];
               
               if( bundle == nil) NSLog( @"**** Bundle opening failed for plugin: %@", path);
               else
               {
                  if (![bundle load]) NSLog( @"******* Bundle code loading failed for plugin %@", path);
                  else
                  {
                     Class filterClass = [bundle principalClass];
                     if(!filterClass) NSLog( @"********* principal class not found for: %@ - %@", name, [bundle principalClass]);
                     else
                     {
                        //accepted
                        [pluginsBundleDictionnary setObject:bundle forKey:path];
                        NSDictionary *infoDictionary=[bundle infoDictionary];
                        NSString *version = infoDictionary[(NSString*) kCFBundleVersionKey];
                        if( version == nil) version = infoDictionary[@"CFBundleShortVersionString"];
                        NSLog( @"Loaded: %@, vers: %@ (%@)", [name stringByDeletingPathExtension], version, path);
                        
                        if (infoDictionary[@"FileFormats"])
                        {
#pragma mark - type FileFormats (no filter registered)
                           NSEnumerator *enumerator = [infoDictionary[@"FileFormats"] objectEnumerator];
                           NSString *fileFormat;
                           while (fileFormat = [enumerator nextObject])
                           {
                              //we will save the bundle rather than a filter.  Each file decode will require a separate decoder
                              [fileFormatPlugins setObject:bundle forKey:fileFormat];
                           }
                        }
                        else if ([infoDictionary[@"pluginType"] rangeOfString:@"Pre-Process"].location != NSNotFound)
                        {
#pragma mark type Pre-Process
                           PluginFilter *filter = [filterClass filter];
                           [preProcessPlugins addObject: filter];
                        }
                        else if ( [filterClass instancesRespondToSelector:@selector(filterImage:)])
                        {
#pragma mark method filterImage (with menus and toolbar names)
                           PluginFilter *filter = [filterClass filter];
                           
                           //menu
                           NSArray *menuTitles = [[bundle infoDictionary] objectForKey:@"MenuTitles"];
                           if( menuTitles)
                           {
                              for( NSString *menuTitle in menuTitles)
                              {
                                 [plugins setObject:filter forKey:menuTitle];
                                 [pluginBundles setObject:bundle forKey:menuTitle];
                              }
                           }
                           
                           //toolbar exclusive of menutitles
                           NSArray *toolbarNames = infoDictionary[@"ToolbarNames"];
                           if( toolbarNames)
                           {
                              for( NSString *toolbarName in toolbarNames)
                              {
                                 [plugins setObject:filter forKey:toolbarName];
                                 [pluginBundles setObject:bundle forKey:toolbarName];
                              }
                           }
                        }
                        
#pragma mark - additionally, for type Report
                        if ([infoDictionary[@"pluginType"] rangeOfString: @"Report"].location != NSNotFound)
                        {
                           [reportPlugins setObject:bundle forKey:infoDictionary[@"CFBundleExecutable"]];
                        }
                     }
                  }
               }
               
               [PluginManager endProtectForCrash];
            }
            @catch( NSException *e)
            {
               NSLog( @"******** Plugin loading exception: %@", e);
            }
         }
         
         
         NSLog( @"|||||||||||||||||| Plugins loading END ||||||||||||||||||");
      }
      @catch (NSException * e)
      {
         N2LogExceptionWithStackTrace(e);
      }
   }
   return self;
}

#pragma mark -

+(void)setMenus:(NSMenu*)filtersMenu
               :(NSMenu*)roisMenu
               :(NSMenu*)othersMenu
               :(NSMenu*)dbMenu
{
   //cleaning the IBOutlets of AppController
    [filtersMenu removeAllItems];
    [roisMenu removeAllItems];
    [othersMenu removeAllItems];
    [dbMenu removeAllItems];
	
   //filling the IBOutlets of AppController
	for (NSBundle *bundle in [pluginBundles allValues])
	{
      NSDictionary *infoDictionary=[bundle infoDictionary];
		NSString	*pluginName = infoDictionary[@"CFBundleExecutable"];
		NSString	*pluginType = infoDictionary[@"pluginType"];
		NSArray	*menuTitles = infoDictionary[@"MenuTitles"];
		
      [PluginManager startProtectForCrashWithPath: [bundle bundlePath]];
		if(menuTitles)
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
						else if(  [pluginType rangeOfString: @"Database"].location != NSNotFound
                          ||[pluginType rangeOfString: @"Report"].location != NSNotFound
                          )
						{
							[item setTarget: [BrowserController currentBrowser]];
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
	
            
            //insert the subMenu as an item of the corresponding Menu
				id  subMenuItem;
   
				if([pluginType rangeOfString: @"imageFilter"].location != NSNotFound)
				{
               subMenuItem = [filtersMenu insertItemWithTitle:pluginName
                                                       action:nil
                                                keyEquivalent:@""
                                                      atIndex:[filtersMenu numberOfItems]
                              ];
               [filtersMenu setSubmenu:subMenu
                               forItem:subMenuItem
                ];
				}
				else if( [pluginType rangeOfString: @"roiTool"].location != NSNotFound)
				{
					if( [roisMenu indexOfItemWithTitle: pluginName] == -1)
					{
						subMenuItem = [roisMenu insertItemWithTitle:pluginName
                                                       action:nil
                                                keyEquivalent:@""
                                                      atIndex:[roisMenu numberOfItems]
                                 ];
						[roisMenu setSubmenu:subMenu
                               forItem:subMenuItem
                   ];
					}
				}
				else if( [pluginType rangeOfString: @"fusionFilter"].location != NSNotFound)
				{
					if( [fusionPluginsMenu indexOfItemWithTitle: pluginName] == -1)
					{
						subMenuItem = [fusionPluginsMenu insertItemWithTitle:pluginName
                                                                action:nil keyEquivalent:@""
                                                               atIndex:[fusionPluginsMenu numberOfItems]
                                 ];
						[fusionPluginsMenu setSubmenu:subMenu
                                        forItem:subMenuItem
                   ];
					}
				}
				else if( [pluginType rangeOfString: @"Database"].location != NSNotFound)
				{
					if( [dbMenu indexOfItemWithTitle: pluginName] == -1)
					{
						subMenuItem = [dbMenu insertItemWithTitle:pluginName
                                                     action:nil
                                              keyEquivalent:@""
                                                    atIndex:[dbMenu numberOfItems]
                                 ];
						[dbMenu setSubmenu:subMenu
                             forItem:subMenuItem
                   ];
					}
				} 
				else
				{
					if( [othersMenu indexOfItemWithTitle: pluginName] == -1)
					{
						subMenuItem = [othersMenu insertItemWithTitle:pluginName
                                                         action:nil
                                                  keyEquivalent:@""
                                                        atIndex:[othersMenu numberOfItems]
                                 ];
						[othersMenu setSubmenu:subMenu
                                 forItem:subMenuItem
                   ];
					}
				}
                
                [subMenuItem setRepresentedObject:bundle];
			}
			else
			{
				// Create a menu item without submenu
				
				NSMenuItem *item = [[[NSMenuItem alloc] init] autorelease];
				[item setTitle: [menuTitles objectAtIndex: 0]];
            [item setRepresentedObject:bundle];
				
				if( [pluginType rangeOfString: @"fusionFilter"].location != NSNotFound)
				{
					[fusionPlugins addObject:[item title]];
					[item setAction:@selector(endBlendingType:)];
				}
				else if(  [pluginType rangeOfString: @"Database"].location != NSNotFound
                    || [pluginType rangeOfString: @"Report"].location != NSNotFound
                    )
				{
					[item setTarget:[BrowserController currentBrowser]];
					[item setAction:@selector(executeFilterDB:)];
				}
				else
				{
					[item setTarget:nil];	// FIRST RESPONDER !
					[item setAction:@selector(executeFilter:)];
				}
				
            
            // insert it in the right category
            
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
   
   //plugins can change the Menus... or do whatever...
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

#pragma mark - crash prevention


+(void)startProtectForCrashWithFilter:(id)filter
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

+(void)startProtectForCrashWithPath:(NSString*) path
{
   // Match with AppController, ILCrashReporter
   [path writeToFile: @"/tmp/PluginCrashed" atomically: YES encoding: NSUTF8StringEncoding error: nil];
}

+(void)endProtectForCrash
{
   // Match with AppController, ILCrashReporter
   [[NSFileManager defaultManager] removeItemAtPath: @"/tmp/PluginCrashed" error: nil];
}


@end
