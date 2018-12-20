#import "Plugin.h"

@interface ROIToolPlugin : Plugin {
}

+(void)classProcess:(id)object sender:(id)sender;
-(void)initPlugin;
-(long)process:(id)object sender:(id)sender;

@end
