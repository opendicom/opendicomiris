#import "N2XMLRPC.h"
#import "ISO8601DateFormatter.h"
#import <NSData+N2.h>
#import <NSString+N2.h>

@implementation N2XMLRPC

+(NSObject*)ParseElement:(NSXMLNode*)node {
	if ([node kind] == NSXMLTextKind)
		return [node stringValue];
	
	NSXMLElement* element = (NSXMLElement*)node;
	
	if ([[element name] isEqualToString:@"array"]) {
		NSArray* values = [element nodesForXPath:@"data/value" error:NULL];
		NSMutableArray* returnValues = [NSMutableArray arrayWithCapacity:[values count]];
		for (NSXMLElement* value in values) {
            [returnValues addObject:[N2XMLRPC ParseElement:value]];
        }
		return [NSArray arrayWithArray:returnValues];
	}
	
	if ([[element name] isEqualToString:@"base64"]) {
		return [NSData dataWithBase64:[[element childAtIndex:0] stringValue]];
	}
	
	if ([[element name] isEqualToString:@"boolean"]) {
		return [NSNumber numberWithBool:[[element stringValue] boolValue]];
	}
	
	if ([[element name] isEqualToString:@"dateTime.iso8601"]) {
		return [[[[ISO8601DateFormatter alloc] init] autorelease] dateFromString:[element stringValue]];
	}
	
	if ([[element name] isEqualToString:@"double"]) {
		return [NSNumber numberWithDouble:[[element stringValue] doubleValue]];
	}
	
	if ([[element name] isEqualToString:@"i4"] || [[element name] isEqualToString:@"int"]) {
		return [NSNumber numberWithInt:[[element stringValue] intValue]];
	}
	
	if ([[element name] isEqualToString:@"string"]) {
		return [[element stringValue] xmlUnescapedString];
	}
	
	if ([[element name] isEqualToString:@"struct"]) {
		NSArray* members = [element nodesForXPath:@"member" error:NULL];
		NSMutableDictionary* returnMembers = [NSMutableDictionary dictionaryWithCapacity:[members count]];
        for (NSXMLElement* m in members)
            [returnMembers setObject:[N2XMLRPC ParseElement:[[m nodesForXPath:@"value" error:NULL] objectAtIndex:0]] forKey:[[[[m nodesForXPath:@"name" error:NULL] objectAtIndex:0] stringValue] xmlUnescapedString]];
        return [NSDictionary dictionaryWithDictionary:returnMembers];
	}
	
	if ([[element name] isEqualToString:@"nil"]) {
		return NULL;
	}
    
    if ([[element name] isEqualToString:@"value"]) {
        if (element.childCount)
            return [N2XMLRPC ParseElement:[element childAtIndex:0]];
        else return [[element stringValue] xmlUnescapedString];
    }
	
	[NSException raise:NSGenericException format:@"unhandled XMLRPC data type: %@", [element name]]; return NULL;
}

+(NSString*)FormatElement:(NSObject*)object {
	if (!object)
		return @"<nil/>";
	
	if ([object isKindOfClass:[NSDictionary class]]) {
		NSMutableString* string = [NSMutableString stringWithCapacity:512];
		[string appendString:@"<struct>"];
		for (NSString* key in (NSDictionary*)object)
			[string appendFormat:@"<member><name>%@</name><value>%@</value></member>",
          key,
          [N2XMLRPC FormatElement:[(NSDictionary*)object objectForKey:key] ]
          ];
		[string appendString:@"</struct>"];
		return [NSString stringWithString:string];
	}
	
	if ([object isKindOfClass:[NSString class]]) return [NSString stringWithFormat:@"<string>%@</string>", [(NSString*)object xmlEscapedString]];

	
	if ([object isKindOfClass:[NSArray class]]) {
		NSMutableString* string = [NSMutableString stringWithCapacity:512];
		[string appendString:@"<array><data>"];
		for (NSObject* indexedObject in (NSArray*)object)
			[string appendFormat:@"<value>%@</value>",
          [N2XMLRPC FormatElement:indexedObject]
          ];
		[string appendString:@"</data></array>"];
		return [NSString stringWithString:string];
	}
	
	if ([object isKindOfClass:[NSDate class]]) {
		return [NSString stringWithFormat:@"<dateTime.iso8601>%@</dateTime.iso8601>", [[[[ISO8601DateFormatter alloc] init] autorelease] stringFromDate:(NSDate*)object]];
	}
	
	if ([object isKindOfClass:[NSData class]]) {
		return [NSString stringWithFormat:@"<base64>%@</base64>", [(NSData*)object base64]];
	}
	
	if ([object isKindOfClass:[NSNumber class]])
		switch (CFNumberGetType((CFNumberRef)((NSNumber * )object))) {
            case kCFNumberCharType:
				return [NSString stringWithFormat:@"<boolean>%d</boolean>", int([(NSNumber*)object boolValue])];
            case kCFNumberSInt8Type:
            case kCFNumberSInt16Type:
            case kCFNumberSInt32Type:
            case kCFNumberSInt64Type:
            case kCFNumberShortType:
            case kCFNumberIntType:
            case kCFNumberLongType:
            case kCFNumberLongLongType:
            case kCFNumberCFIndexType:
            case kCFNumberNSIntegerType:
				return [NSString stringWithFormat:@"<int>%d</int>", [(NSNumber*)object intValue]];
            case kCFNumberFloatType:
            case kCFNumberFloat32Type:
            case kCFNumberFloat64Type:
            case kCFNumberDoubleType:
            case kCFNumberCGFloatType:
				return [NSString stringWithFormat:@"<double>%f</double>", [(NSNumber*)object doubleValue]];
            default:
				[NSException raise:NSGenericException format:@"execution succeeded but return NSNumber of type %d unsupported", (int)CFNumberGetType((CFNumberRef)((NSNumber * )object))]; return NULL;
        }
	
	[NSException raise:NSGenericException format:@"execution succeeded but return class %@ unsupported", [object className]]; return NULL;
}

+(NSString*)requestWithMethodName:(NSString*)methodName arguments:(NSArray*)args {
    NSMutableString* request = [NSMutableString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"UTF-8\"?><methodCall><methodName>%@</methodName><params>", methodName];
    for (id arg in args)
		[request appendFormat:@"<param><value>%@</value></param>", [[self class] FormatElement:arg]];
    [request appendFormat:@"</params></methodCall>"];
	return request;
}

+(NSString*)responseWithValue:(id)value
{
    return [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"UTF-8\"?><methodResponse><params><param><value>%@</value></param></params></methodResponse>", [[self class] FormatElement:value]];
}

@end





