#import "DatabasePlugin.h"

#import "BrowserController.h"
#import "DicomSeries.h"

@implementation DatabasePlugin

#pragma mark common instanciating and recycling

-(id)init{
   if (self = [super init])
   {
      NSLog(@"INIT DatabasePlugin");
   }
   return self;
}

-(void)dealloc
{
   NSLog( @"DEALLOC DatabasePlugin");
   [super dealloc];
}


+(Plugin *)instantiate
{
   NSLog( @"INSTANTIATE DatabasePlugin");
   return [[[self alloc] init] autorelease];
}

#pragma mark to subclass

+(void)classExecute:(id)object
{
   NSLog( @"DatabasePlugin classExecute Error, you should not be here!");
}


-(long)execute:(id)object
{
   NSLog( @"DatabasePlugin execute Error, you should not be here!");
   return -1;
}

#pragma mark tools

-(NSMutableSet*)selectedDicomStudy
{
   MyOutlineView *databaseOutline=[BrowserController currentBrowser].databaseOutline;
 
   NSMutableSet * dicomStudyset=[NSMutableSet set];
   NSIndexSet *selectedItems = [databaseOutline selectedRowIndexes];
   [selectedItems enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *stop) {
      NSManagedObject *item = [databaseOutline itemAtRow:idx];
      if ([item isKindOfClass:[DicomSeries class]]) item = [item valueForKey:@"study"];
      [dicomStudyset addObject:item];
   }];
   return dicomStudyset;
}

@end
