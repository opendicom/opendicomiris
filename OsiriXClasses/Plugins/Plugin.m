#import "Plugin.h"

@implementation Plugin

#pragma mark common instanciating and recycling

-(id)init{
	if (self = [super init])
	{
      NSLog(@"INIT Plugin");
	}
	return self;
}

-(void)dealloc
{
	NSLog( @"DEALLOC Plugin");
	[super dealloc];
}


+(Plugin *)instantiate
{
   NSLog( @"INSTANTIATE Plugin");
   return [[[self alloc] init] autorelease];
}

#pragma mark to subclass

+(void)classExecute:(id)object
{
   NSLog( @"Plugin classExecute Error, you should not be here!");
}


-(long)execute:(id)object
{
	NSLog( @"Plugin execute Error, you should not be here!");
    return -1;
}

-(void)privateSchemeExecuteWithURLString:(NSString*)urlString
{
   NSLog( @"Plugin Error.Should be overriden by subclass");
}

@end
