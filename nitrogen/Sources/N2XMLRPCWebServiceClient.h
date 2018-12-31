#import "N2WebServiceClient.h"


@interface N2XMLRPCWebServiceClient : N2WebServiceClient {
}

-(id)execute:(NSString*)methodName arguments:(NSArray*)args;

@end
