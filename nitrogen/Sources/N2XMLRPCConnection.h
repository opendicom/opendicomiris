#import <Foundation/Foundation.h>
#import "N2Connection.h"

@protocol N2XMLRPCConnectionDelegate <NSObject>

@optional
-(NSString*)selectorStringForXMLRPCRequestMethodName:(NSString*)name;
-(BOOL)isSelectorAvailableToXMLRPC:(NSString*)selectorString;

@end

//-------------------------------------------------------------------


@interface N2XMLRPCConnection : N2Connection {
	NSObject<N2XMLRPCConnectionDelegate>* _delegate;
   BOOL _executed;
   BOOL _waitingToClose;
	NSTimer* _timeout;
   NSXMLDocument* _doc;
}

@property(retain) NSObject<N2XMLRPCConnectionDelegate>* delegate;

-(void)handleRequest:(CFHTTPMessageRef)request;
-(id)methodCall:(NSString*)methodName params:(NSArray*)params error:(NSError**)error; 
-(void)writeAndReleaseResponse:(CFHTTPMessageRef)response;

@end

