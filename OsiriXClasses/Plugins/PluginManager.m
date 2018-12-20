#import "PluginManager.h"
#import "NSFileManager+N2.h"

enum{
   reportType=0,
   databaseType,
   imageFilterType,
   roiToolType,
   preProcessType,
   fileFormatType,
   fusionFilterType,
   otherType
};

static NSArray *         pluginTypes=nil;

static NSMenu *         _fusionMenu = nil;

static NSDictionary *   _fileFormatClasses = nil;
static NSDictionary *   _fileFormatSingletons = nil;

static NSArray *        _preProcessClasses = nil;
static NSArray *        _preProcessSingletons = nil;

@implementation PluginManager

#pragma mark - properties

+(NSArray*)preProcessClasses {return _preProcessClasses;}
+(NSArray*)preProcessSingletons {return _preProcessSingletons;}

+(NSDictionary*)fileFormatClasses {return _fileFormatClasses;}
+(NSDictionary*)fileFormatSingletons {return _fileFormatSingletons;}


#pragma mark -

-(void)initialize
{
   NSLog(@"INITIALIZE pluginManager");

}

NSMenuItem* menuItemBasedOnDict(NSString* name, id target, SEL action, NSMenu* currentMenu, NSString* title, NSDictionary* dict)
{
   //constant
   //name=pluginName
   //target=singleton
   //action=method @selector(execute:)
   
   //variable down the nodes
   //currentMenu=where to attach
   //title=menuItem name
   //dict
   
   //instantiate
   NSMenuItem *menuItem = [[NSMenuItem alloc] init];
   [menuItem setTitle:title];
   [menuItem setTag:[dict[@"_tag"] integerValue]];
   [menuItem setRepresentedObject:name];

   //find subitem
   if (dict && [dict count]>2)//ignore _order and _tag
   {
      [currentMenu addItem:menuItem];
      NSMenu* subMenu=[[NSMenu alloc] init];
      [menuItem setSubmenu:subMenu];

      //clasify the subitems
      NSMutableArray* indexedKeys=[NSMutableArray array];
      for (NSString* key in [dict allKeys])
      {
         if (![@[@"_index",@"_tag"] containsObject:key])
            [indexedKeys addObject:
             [[dict[key][@"_index"] stringValue] stringByAppendingPathComponent:key]
             ];
      }
      [indexedKeys sortUsingSelector:@selector(compare:)];
      
      //loop
      for (NSString* indexedKey in indexedKeys)
      {
         NSMutableArray* indexedKeyParts=[NSMutableArray arrayWithArray:[indexedKey componentsSeparatedByString:@"/"]];
         [indexedKeyParts removeObjectAtIndex:0];
         NSString* key=[indexedKeyParts componentsJoinedByString:@"/"];
         if ([key isEqualToString:@"-"]) [subMenu addItem:[NSMenuItem separatorItem]];
         else [subMenu addItem:menuItemBasedOnDict(name, target, action, subMenu, key, dict[key])];//recursion
      }
   }
   else
   {
      //leaf
      [menuItem setTarget:target];//plugin singleton
      [menuItem setAction:@selector(execute:)];
   }
   return menuItem;
}



//basic init
-(id)init
{
   if (self = [super init])
   {
   }
   return self;
}

//first init from appController
-(id)initForMenus:(NSMenu *)reportMenu :(NSMenu *)databaseMenu :(NSMenu *)imageMenu :(NSMenu *)roiToolMenu
{
   if (self = [super init])
   {
      pluginTypes=@[
                    @"report",
                    @"database",
                    @"image",
                    @"roiTool",
                    @"preProcess",
                    @"fileFormat",
                    @"fusion",
                    @"other"
                    ];
      [pluginTypes retain];
      
      _fusionMenu   = [[NSMenu alloc]initWithTitle:@"" ];
      [_fusionMenu retain];

      NSMutableDictionary* fileFormatClasses = [NSMutableDictionary dictionary];
      NSMutableDictionary* fileFormatSingletons = [NSMutableDictionary dictionary];
      
      NSMutableArray*      preProcessClasses = [NSMutableArray array];
      NSMutableArray*      preProcessSingletons = [NSMutableArray array];

      
      //where to find the plugins?
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
      

      NSLog( @"|||||||| PlugIns loading START ||||||||");
      for (NSString* path in @[appPath, userPath])
      {
         NSArray* pluginsInDir = [defaultManager directoryContentsAtPath:path];
         for (NSString* nameExtension in pluginsInDir)
         {
            NSString* name=[nameExtension stringByDeletingPathExtension];
            NSString* extension=[nameExtension pathExtension];
            if (  [@[@"plugin",@"osirixplugin"] containsObject:extension])
            {
               NSString* bundlePath=[defaultManager destinationOfAliasOrSymlinkAtPath:[path stringByAppendingPathComponent:nameExtension]];
               NSLog(@"|||||||| %@",bundlePath);
               NSBundle *bundle = [[NSBundle alloc] initWithPath: bundlePath];
               if( bundle == nil){
                  NSLog( @"failed opening bundle");
                  return nil;
               }

               
               NSError* error;
               if (![bundle loadAndReturnError:&error]){
                  NSLog( @"failed loading bundle.\r%@", [error description]);
                  return nil;
               }
               
               
               Class pluginClass = [[bundle principalClass]retain];
               if(!pluginClass){
                  NSLog( @"principal class not found");
                  return nil;
               }
               if (![pluginClass instancesRespondToSelector:@selector(execute:)]){
                  NSLog( @"no @selector(execute:)");
                  return nil;
               }

               //replace filter by instance everywhere
               id pluginSingleton=[[pluginClass instantiate]retain];
               if(!pluginSingleton){
                  NSLog( @"principal class not instantiable");
                  return nil;
               }
               
               NSDictionary* infoDictionary=[bundle infoDictionary];
               NSLog( @"version: %@",infoDictionary[@"CFBundleVersion"]);

               switch ([pluginTypes indexOfObject:(infoDictionary[@"pluginType"])]) {
                     
                     
#pragma mark reportType
                  case reportType:;
                     //filterImage: opens a report template
                     menuItemBasedOnDict(
                                          name,
                                          pluginSingleton,
                                          @selector(execute:),
                                          reportMenu,
                                          name,
                                          infoDictionary[@"menuItems"]
                                         );
                     //file>report>save genera un informe en base al editor
                     //file>report>delete borra el editor
                     break;
                     
/*
#pragma mark databaseType
                  case databaseType:
                     //filterImage: realiza una operación sobre el browser (NO sobre 2D viewers)
                     if (menuTitles && [menuTitles count])
                     {
                        for (NSString* menuTitle in menuTitles)
                        {
                           NSString* compoundKey=[bundleName stringByAppendingPathExtension:menuTitle];
                           [pluginClasses setObject:pluginClass forKey:compoundKey];
                           [pluginSingletons setObject:pluginSingleton forKey:compoundKey];
                           [databasePluginNames setObject:bundle forKey:compoundKey];
                        }
                     }
                     else
                     {
                        [pluginClasses setObject:pluginClass forKey:bundleName];
                        [pluginSingletons setObject:pluginSingleton forKey:bundleName];
                        [databasePluginNames setObject:bundle forKey:bundleName];
                     }
                     break;
                     
                     
#pragma mark imageFilterType
                  case imageFilterType:
                     //filterImage: crea visualizador 2D
                     if (menuTitles && [menuTitles count])
                     {
                        for (NSString* menuTitle in menuTitles)
                        {
                           NSString* compoundKey=[bundleName stringByAppendingPathExtension:menuTitle];
                           [pluginClasses setObject:pluginClass forKey:compoundKey];
                           [pluginSingletons setObject:pluginSingleton forKey:compoundKey];
                           [imageFilterPluginNames setObject:bundle forKey:compoundKey];
                        }
                     }
                     else
                     {
                        [pluginClasses setObject:pluginClass forKey:bundleName];
                        [pluginSingletons setObject:pluginSingleton forKey:bundleName];
                        [imageFilterPluginNames setObject:bundle forKey:bundleName];
                     }
                     break;
                     
                     
#pragma mark roiToolType
                  case roiToolType:
                     //filterImage: actua sobre un visualizador existente
                     if (menuTitles && [menuTitles count])
                     {
                        for (NSString* menuTitle in menuTitles)
                        {
                           NSString* compoundKey=[bundleName stringByAppendingPathExtension:menuTitle];
                           [pluginClasses setObject:pluginClass forKey:compoundKey];
                           [pluginSingletons setObject:pluginSingleton forKey:compoundKey];
                           [roiToolPluginNames setObject:bundle forKey:compoundKey];
                        }
                     }
                     else
                     {
                        [pluginClasses setObject:pluginClass forKey:bundleName];
                        [pluginSingletons setObject:pluginSingleton forKey:bundleName];
                        [roiToolPluginNames setObject:bundle forKey:bundleName];
                     }
                     break;
                     
                     
#pragma mark preProcessType
                  case preProcessType:
                     //processFiles: modify of the list of files received in INCOMING
                     [preProcessClasses addObject:pluginClass];
                     [preProcessSingletons addObject:pluginSingleton];
                     NSString* compoundKey=[bundleName stringByAppendingPathExtension:bundleName];
                     [preProcessPluginNames setObject:bundle forKey:compoundKey];
                     break;
                     
                     
#pragma mark fileFormatType
                  case fileFormatType:;
                     //reading of the files to feed a 2D viewer
                     for (NSDictionary* documentTypes in (NSArray*)infoDictionary[@"Document types"])
                     {
                        for (NSString* ext in (NSArray*)documentTypes[@"CFBundleTypeExtensions"]){
                           NSString* compoundKey=[bundleName stringByAppendingPathExtension:ext];
                           [fileFormatClasses setObject:pluginClass forKey:compoundKey];
                           [fileFormatSingletons setObject:pluginSingleton forKey:compoundKey];
                           [fileFormatPluginNames setObject:bundle forKey:ext];
                        }
                        for (NSString* mime in (NSArray*)documentTypes[@"Document MIME Types"]){
                           NSString* compoundKey=[bundleName stringByAppendingPathExtension:mime];
                           [fileFormatClasses setObject:pluginClass forKey:compoundKey];
                           [fileFormatSingletons setObject:pluginSingleton forKey:compoundKey];
                           [fileFormatPluginNames setObject:bundle forKey:mime];
                        }
                        for (NSString* uti in (NSArray*)documentTypes[@"Exportable Type UTIs"]){
                           NSString* compoundKey=[bundleName stringByAppendingPathExtension:uti];
                           [fileFormatClasses setObject:pluginClass forKey:compoundKey];
                           [fileFormatSingletons setObject:pluginSingleton forKey:compoundKey];
                           [fileFormatPluginNames setObject:bundle forKey:uti];
                        }
                     }
                     break;
                     
                     
#pragma mark fusionFilterType
                  case fusionFilterType:
                     //appears in the fusion panel
                     if (menuTitles && [menuTitles count])
                     {
                        for (NSString* menuTitle in menuTitles)
                        {
                           NSString* compoundKey=[bundleName stringByAppendingPathExtension:menuTitle];
                           [pluginClasses setObject:pluginClass forKey:compoundKey];
                           [pluginSingletons setObject:pluginSingleton forKey:compoundKey];
                           [fusionFilterPluginNames setObject:bundle forKey:compoundKey];
                        }
                     }
                     else
                     {
                        [pluginClasses setObject:pluginClass forKey:bundleName];
                        [pluginSingletons setObject:pluginSingleton forKey:bundleName];
                        [fusionFilterPluginNames setObject:bundle forKey:bundleName];
                     }
                     break;
                     
                     
#pragma mark otherType
                  default://other
                     if (menuTitles && [menuTitles count])
                     {
                        for (NSString* menuTitle in menuTitles)
                        {
                           NSString* compoundKey=[bundleName stringByAppendingPathExtension:menuTitle];
                           [pluginClasses setObject:pluginClass forKey:compoundKey];
                           [pluginSingletons setObject:pluginSingleton forKey:compoundKey];
                           [otherPluginNames setObject:bundle forKey:compoundKey];
                        }
                     }
                     else
                     {
                        [pluginClasses setObject:pluginClass forKey:bundleName];
                        [pluginSingletons setObject:pluginSingleton forKey:bundleName];
                        [otherPluginNames setObject:bundle forKey:bundleName];
                     }
                     break;
 */
               }

               
            }
         }
      }
      
      _fileFormatClasses=[[NSDictionary dictionaryWithDictionary:fileFormatClasses]retain];
      _fileFormatSingletons=[[NSDictionary dictionaryWithDictionary:fileFormatSingletons]retain];
      
      _preProcessClasses=[[NSArray arrayWithArray:preProcessClasses]retain];
      _preProcessSingletons=[[NSArray arrayWithArray:preProcessSingletons]retain];
      
      
      NSLog( @"|||||||| Plugins loading END ||||||||");

   }
   return self;
}

#pragma mark -

NSMenuItem* appendTitleItem(NSMenu* menu, NSString* title)
{
   if ([title isEqualToString:@"-"])
   {
      [menu insertItem:[NSMenuItem separatorItem] atIndex:[menu numberOfItems]];
      return nil;
   }
   NSMenuItem* titleItem = [[[NSMenuItem alloc] init] autorelease];
   [titleItem setTitle:title];
   [menu insertItem:titleItem atIndex:[menu numberOfItems]];
   return titleItem;
}

void setPluginMenus(NSMenu* mainMenu, NSDictionary* pluginNames)
{
   NSMutableString* previousName=[NSMutableString string];
   NSMenu* currentMenu=nil;
   NSMenuItem* currentMenuItem=nil;
   for (NSString* nameTitle in pluginNames)
   {
      NSString* name=[nameTitle stringByDeletingPathExtension];
      if (![name isEqualToString:previousName])
      {
         //append another plugin
         [previousName setString:name];
         currentMenu=mainMenu;
         NSMenuItem *nameItem = [[[NSMenuItem alloc] init] autorelease];
         [nameItem setTitle:name];
         [nameItem setRepresentedObject:pluginNames[nameTitle]];
         [currentMenu insertItem:nameItem atIndex:[currentMenu numberOfItems]];
         
         if ([name isEqualToString:nameTitle]) currentMenuItem=nameItem;//is leaf (without title)
         else //is node
         {
            NSMenu* subMenu=[[[NSMenu alloc] initWithTitle:name] autorelease];
            [currentMenu setSubmenu:subMenu forItem:nameItem];
            
            //move to node submenu
            currentMenu=subMenu;
            
            //...and appened the first title
            currentMenuItem=appendTitleItem(currentMenu,[nameTitle pathExtension]);
         }
      }
      else
      {
         //appened another title
         currentMenuItem=appendTitleItem(currentMenu,[nameTitle pathExtension]);
      }
      
      
      //bind
      if (currentMenuItem)
      {
         //no action
      }
   }
   
}


void setImageFilterPluginMenus(NSMenu* mainMenu, NSDictionary* pluginNames)
{
   NSMutableString* previousName=[NSMutableString string];
   NSMenu* currentMenu=nil;
   NSMenuItem* currentMenuItem=nil;
   for (NSString* nameTitle in pluginNames)
   {
      NSString* name=[nameTitle stringByDeletingPathExtension];
      if (![name isEqualToString:previousName])
      {
         //append another plugin
         [previousName setString:name];
         currentMenu=mainMenu;
         NSMenuItem *nameItem = [[[NSMenuItem alloc] init] autorelease];
         [nameItem setTitle:name];
         [nameItem setRepresentedObject:pluginNames[nameTitle]];
         [currentMenu insertItem:nameItem atIndex:[currentMenu numberOfItems]];
         
         if ([name isEqualToString:nameTitle]) currentMenuItem=nameItem;//is leaf (without title)
         else //is node
         {
            NSMenu* subMenu=[[[NSMenu alloc] initWithTitle:name] autorelease];
            [currentMenu setSubmenu:subMenu forItem:nameItem];
            
            //move to node submenu
            currentMenu=subMenu;
            
            //...and appened the first title
            currentMenuItem=appendTitleItem(currentMenu,[nameTitle pathExtension]);
         }
      }
      else
      {
         //appened another title
         currentMenuItem=appendTitleItem(currentMenu,[nameTitle pathExtension]);
      }
      
      
      //bind
      if (currentMenuItem)
      {
         [currentMenuItem setTarget:nil];   // FIRST RESPONDER !
         [currentMenuItem setAction:@selector(executeFilter:)];
      }
   }
   
}


@end
