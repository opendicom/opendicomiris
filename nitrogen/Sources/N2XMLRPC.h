#import <Foundation/Foundation.h>


@interface N2XMLRPC : NSObject {
}

+(NSObject*)ParseElement:(NSXMLNode*)node;
+(NSString*)FormatElement:(NSObject*)object;

+(NSString*)requestWithMethodName:(NSString*)methodName arguments:(NSArray*)args;
+(NSString*)responseWithValue:(id)value;

@end
