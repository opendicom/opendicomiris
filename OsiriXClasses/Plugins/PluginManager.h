#import "Plugin.h"

/*
 Initialization invoked by applicationController in two steps (init and setMenu:)
 
 init reads the contents of:
 - $APP/contents/PlugIns
 - ~/Library/Application\ Support/opendicomiris/PlugIns
 
 (I in PlugIns (consistent with Apple, divergent from OsiriX)
*/

@interface PluginManager : NSObject {}

//first segment of url path
@property (class,readonly,retain) NSDictionary * privateSchemeRegexes;
@property (class,readonly,retain) NSDictionary * privateSchemeSingletons;

//non categorized plugins
@property (class,readonly,retain) NSDictionary * pluginClasses;
@property (class,readonly,retain) NSDictionary * pluginSingletons;

//receiver
@property (class,readonly,retain) NSArray * preProcessClasses;
@property (class,readonly,retain) NSArray * preProcessSingletons;

//file parser
@property (class,readonly,retain) NSDictionary * fileFormatClasses;//key: format
@property (class,readonly,retain) NSDictionary * fileFormatSingletons;//key: format

//responder: passes IBOutlets to be filled by PluginManager
-(id)initForMenus:(NSMenu *)reportMenu :(NSMenu *)databaseMenu :(NSMenu *)imageMenu :(NSMenu *)roiToolMenu;

/*
 menuItems in info.plist of the plugin is recursively formated as follow:
 
 _index
 _tag
 item
   _index
   _tag
 */

@end
