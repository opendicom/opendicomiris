#import <Cocoa/Cocoa.h>

//allows multiple GET and POST to a predifined URL

enum HTTPMethod {
	HTTPGet,
	HTTPPost
};

@interface N2WebServiceClient : NSObject {
	NSURL* _url;
}

@property(retain) NSURL* url;

-(id)initWithURL:(NSURL*)url;

-(NSData*)requestWithURL:(NSURL*)url
                  method:(HTTPMethod)method
                 content:(NSData*)content
                 headers:(NSDictionary*)headers
                 context:(id)context;

-(NSData*)requestWithMethod:(HTTPMethod)method
                    content:(NSData*)content
                    headers:(NSDictionary*)headers
                    context:(id)context;

-(NSData*)requestWithMethod:(HTTPMethod)method
                    content:(NSData*)content
                    headers:(NSDictionary*)headers;

-(NSData*)getWithParameters:(NSDictionary*)params;
-(NSData*)postWithContent:(NSData*)content;
-(NSData*)postWithParameters:(NSDictionary*)params;

@end
