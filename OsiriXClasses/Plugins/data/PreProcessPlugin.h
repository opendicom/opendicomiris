#import "Plugin.h"

@interface PreProcessPlugin : Plugin {
}

+(void)classProcess:(id)object sender:(id)sender;
-(void)initPlugin;
-(long)process:(id)object sender:(id)sender;

//entry point of Pre-Process plugins
//-(long)processFiles: (NSMutableArray*) files;

@end
