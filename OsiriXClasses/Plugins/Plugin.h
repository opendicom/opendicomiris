#import <Cocoa/Cocoa.h>


@interface Plugin : NSObject
{}

+(Plugin *)instantiate;
+(void)classExecute:(id)object;
-(long)execute:(id)object;
-(void)privateSchemeExecuteWithURLString:(NSString*)urlString;
@end
