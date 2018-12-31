#import <Cocoa/Cocoa.h>


@interface N2XMLRPC : NSObject {
}

+(NSObject*)ParseElement:(NSXMLNode*)n;
+(NSString*)FormatElement:(NSObject*)o;

+(NSString*)requestWithMethodName:(NSString*)methodName arguments:(NSArray*)args;
+(NSString*)responseWithValue:(id)value;
+(NSString*)responseWithValue:(id)value options:(NSUInteger)options;

@end
