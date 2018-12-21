#import "PluginManager.h"
#import "NSFileManager+N2.h"

enum{
   reportType=0,
   databaseType,
   imageType,
   roiToolType,
   preProcessType,
   fileFormatType,
   fusionFilterType
};//other types

static NSArray *         pluginTypes=nil;

static NSMenu *         _fusionMenu = nil;

static NSDictionary *   _pluginClasses = nil;
static NSDictionary *   _pluginSingletons = nil;

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

+(NSDictionary*)pluginClasses {return _pluginClasses;}
+(NSDictionary*)pluginSingletons {return _pluginSingletons;}


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
                    ];
      [pluginTypes retain];
      
      _fusionMenu   = [[NSMenu alloc]initWithTitle:@"" ];
      [_fusionMenu retain];

      NSMutableDictionary* pluginClasses = [NSMutableDictionary dictionary];
      NSMutableDictionary* pluginSingletons = [NSMutableDictionary dictionary];

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
                     //opens a report template
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
                     

#pragma mark databaseType
                  case databaseType:
                     //operación sobre browser objects (NO sobre 2D viewers)
                     menuItemBasedOnDict(
                                         name,
                                         pluginSingleton,
                                         @selector(execute:),
                                         databaseMenu,
                                         name,
                                         infoDictionary[@"menuItems"]
                                         );
                     break;
                     

#pragma mark imageFilterType
                  case imageType:
                     //visualizador 2D
                     menuItemBasedOnDict(
                                         name,
                                         pluginSingleton,
                                         @selector(execute:),
                                         imageMenu,
                                         name,
                                         infoDictionary[@"menuItems"]
                                         );
                     break;
                     
                     
#pragma mark roiToolType
                  case roiToolType:
                     //graphic layer
                     menuItemBasedOnDict(
                                         name,
                                         pluginSingleton,
                                         @selector(execute:),
                                         roiToolMenu,
                                         name,
                                         infoDictionary[@"menuItems"]
                                         );
                     break;
                     

#pragma mark preProcessType
                  case preProcessType:
                     //processFiles: modify of the list of files received in INCOMING
                     [preProcessClasses addObject:pluginClass];
                     [preProcessSingletons addObject:pluginSingleton];
                     break;
                     

#pragma mark fileFormatType
                  case fileFormatType:;
                     //reading of the files to feed a 2D viewer
                     for (NSDictionary* documentTypes in (NSArray*)infoDictionary[@"Document types"])
                     {
                        for (NSString* ext in (NSArray*)documentTypes[@"CFBundleTypeExtensions"]){
                           [fileFormatClasses setObject:pluginClass forKey:ext];
                           [fileFormatSingletons setObject:pluginSingleton forKey:ext];
                        }
                        for (NSString* mime in (NSArray*)documentTypes[@"Document MIME Types"]){
                           [fileFormatClasses setObject:pluginClass forKey:mime];
                           [fileFormatSingletons setObject:pluginSingleton forKey:mime];
                        }
                        for (NSString* uti in (NSArray*)documentTypes[@"Exportable Type UTIs"]){
                           [fileFormatClasses setObject:pluginClass forKey:uti];
                           [fileFormatSingletons setObject:pluginSingleton forKey:uti];
                        }
                     }
                     break;
                     

#pragma mark fusionFilterType
                  case fusionFilterType:
                     //appears in the fusion panel
                     menuItemBasedOnDict(
                                         name,
                                         pluginSingleton,
                                         @selector(execute:),
                                         _fusionMenu,
                                         name,
                                         infoDictionary[@"menuItems"]
                                         );
                     break;
                     

#pragma mark otherType
                  default://other
                           [pluginClasses setObject:pluginClass forKey:name];
                           [pluginSingletons setObject:pluginSingleton forKey:name];
                      break;
               }
            }
         }
      }

      _pluginClasses=[[NSDictionary alloc]initWithDictionary:pluginClasses];
      [_pluginClasses retain];
      _pluginSingletons=[[NSDictionary alloc]initWithDictionary:pluginSingletons];
      [_pluginSingletons retain];

      _fileFormatClasses=[NSDictionary dictionaryWithDictionary:fileFormatClasses];
      [_fileFormatClasses retain];
      _fileFormatSingletons=[NSDictionary dictionaryWithDictionary:fileFormatSingletons];
      [_fileFormatSingletons retain];
      
      _preProcessClasses=[NSArray arrayWithArray:preProcessClasses];
      [_preProcessClasses retain];
      _preProcessSingletons=[NSArray arrayWithArray:preProcessSingletons];
      [_preProcessSingletons retain];
      
      
      NSLog( @"|||||||| Plugins loading END ||||||||");

   }
   return self;
}

@end
