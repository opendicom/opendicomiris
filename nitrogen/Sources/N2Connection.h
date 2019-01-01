#import <Foundation/Foundation.h>

extern NSString* N2ConnectionStatusDidChangeNotification;

enum N2ConnectionStatus {
	N2ConnectionStatusClosed = 0,
	N2ConnectionStatusConnecting,
	N2ConnectionStatusOpening,
	N2ConnectionStatusOk
};

@interface N2Connection : NSObject <NSStreamDelegate>
{
	id               _address;
	NSInteger        _port;
	NSInputStream  * _inputStream;
	NSOutputStream * _outputStream;
   NSMutableData  * _inputBuffer;
   NSMutableData  * _outputBuffer;
   NSUInteger       _handleOpenCompleted;
   NSUInteger       _maximumReadSizePerEvent;
   NSUInteger       _handleHasSpaceAvailable;
   NSUInteger       _outputBufferIndex;
	NSInteger        _status;
	BOOL             _tlsFlag;
   BOOL             _closeOnRemoteClose;
   BOOL             _closeWhenDoneSending;
   BOOL             _closeOnNextSpaceAvailable;
   BOOL             _handlingData;
   NSError        * _error;
   NSTimeInterval   lastEventTimeInterval;
}

@property(readonly)        NSString       * address;
@property(readonly)        NSTimeInterval   lastEventTimeInterval;
@property(nonatomic)       NSInteger        status;
@property                  NSUInteger       maximumReadSizePerEvent;
@property                  BOOL             closeOnRemoteClose;
@property                  BOOL             closeWhenDoneSending;
@property                  BOOL             closeOnNextSpaceAvailable;
@property(readonly,retain) NSError        * error;

#pragma mark -
-(id)initWithAddress:(id)address
                port:(NSInteger)port;
-(id)initWithAddress:(id)address
                port:(NSInteger)port
                  is:(NSInputStream*)is
                  os:(NSOutputStream*)os;
-(id)initWithAddress:(id)address
                port:(NSInteger)port
                 tls:(BOOL)tlsFlag;


#pragma mark main init
-(id)initWithAddress:(id)address
                port:(NSInteger)port
                 tls:(BOOL)tlsFlag
                  is:(NSInputStream*)is
                  os:(NSOutputStream*)os;
#pragma mark -

+(NSData*)sendSynchronousRequest:(NSData*)request
                       toAddress:(id)address
                            port:(NSInteger)port;
+(NSData*)sendSynchronousRequest:(NSData*)request
                       toAddress:(id)address
                            port:(NSInteger)port
                             tls:(BOOL)tlsFlag;
+(NSData*)sendSynchronousRequest:(NSData*)request
                       toAddress:(id)address
                            port:(NSInteger)port
               dataHandlerTarget:(id)target
                        selector:(SEL)selector
                         context:(void*)context;


#pragma mark main invocation
+(NSData*)sendSynchronousRequest:(NSData*)request
                       toAddress:(id)address
                            port:(NSInteger)port
                             tls:(BOOL)tlsFlag
               dataHandlerTarget:(id)target
                        selector:(SEL)selector
                         context:(void*)context;
//sendSynchronousRequestThread:
#pragma mark -


-(void)reconnect;
-(void)close;
-(void)open; // declared for overloading only
// -(void)invalidate; // TODO: why?

-(void)startTLS;
-(BOOL)isSecure;

-(void)reconnectToAddress:(id)address port:(NSInteger)port;

-(void)writeData:(NSData*)data;
-(NSInteger)writeBufferSize;
-(void)handleData:(NSMutableData*)data; // overload on subclasses
-(NSInteger)availableSize;
-(NSData*)readData:(NSInteger)size;
-(NSInteger)readData:(NSInteger)size toBuffer:(void*)buffer;

- (NSData*)readBuffer;

-(void)connectionFinishedSendingData; // overload on subclasses

-(void)trySendingDataNow; //...

//+(BOOL)host:(NSString*)host1 isEqualToHost:(NSString*)host2;

@end


