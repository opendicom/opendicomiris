#import "N2XMLRPCConnection.h"

@class N2ConnectionListener;
@class HTTPServerRequest;

/** \brief XML-RPC for RIS integration */
@interface XMLRPCInterface : NSObject<N2XMLRPCConnectionDelegate> {
    N2ConnectionListener* _listener;
}

-(id)methodCall:(NSString*)methodName parameters:(NSDictionary*)parameters error:(NSError**)error;

@end
