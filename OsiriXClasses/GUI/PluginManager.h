#import "PluginFilter.h"

/*
 Initialization invoked by applicationController in two steps:
 
 (1) init reads the contents of $APP/contents/PlugIns and ~/Library/Application Support/opendicomiris/PlugIns   !!! I in PlugIns (consistent with Apple, divergent from OsiriX)
 
 (2) setMenus gives handles to IBOutlets filtersMenu, roisMenu, othersMenu, dbMenu
 */

@interface PluginManager : NSObject {}

//getters
+ (NSMutableDictionary*) plugins;
+ (NSMutableDictionary*) pluginBundles;
+ (NSMutableDictionary*) fileFormatPlugins;
+ (NSMutableDictionary*) reportPlugins;
+ (NSArray*) preProcessPlugins;
+ (NSMenu*) fusionPluginsMenu;
+ (NSArray*) fusionPlugins;

//anti application crash
+ (void) startProtectForCrashWithFilter: (id) filter;
+ (void) startProtectForCrashWithPath: (NSString*) path;
+ (void) endProtectForCrash;

//menus
+ (void) setMenus:(NSMenu*)filtersMenu
                 :(NSMenu*)roisMenu
                 :(NSMenu*)othersMenu
                 :(NSMenu*)dbMenu;

@end
