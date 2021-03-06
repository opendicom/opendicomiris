#import "ReportPlugin.h"

@implementation ReportPlugin

#pragma mark common instanciating and recycling

-(id)init{
   if (self = [super init])
   {
      NSLog(@"INIT ReportPlugin");
   }
   return self;
}

-(void)dealloc
{
   NSLog( @"DEALLOC ReportPlugin");
   [super dealloc];
}


+(Plugin *)instantiate
{
   NSLog( @"INSTANTIATE ReportPlugin");
   return [[[self alloc] init] autorelease];
}

#pragma mark to subclass


+(void)classExecute:(id)object
{
   NSLog( @"ReportPlugin classExecute Error, you should not be here!");
}


#pragma mark to subclass

//open editor with template object for current study
-(long)execute:(id)sender
{
   NSLog( @"ReportPlugin execute Error, you should not be here!");
   return -1;
}


//reset editor for current study
-(long)reset:(id)sender;
{
   NSLog( @"ReportPlugin execute Error, you should not be here!");
   return -1;
}


-(long)generateReport:(id)sender;
{
   NSLog( @"ReportPlugin execute Error, you should not be here!");
   return -1;
}



#pragma mark - report specific methods available to report plugins
+(long)convertReportToPDF:(NSMutableData**)pdfData forStudy:(id)study
{
   return -1;
}


+(long)enclosePDF:(NSMutableData**)pdfData intoDCM:(NSMutableData**)dcmData forStudy:(id)study
{
   return -1;
}


+(long)enclosePDF:(NSMutableData**)pdfData intoCDA:(NSXMLDocument**)cda forStudy:(id)study
{
   return -1;
}



+(long)convertReportToCDA:(NSXMLDocument**)cda forStudy:(id)study
{
   return -1;
}


+(long)encloseCDA:(NSXMLDocument**)cda intoDSCD:(NSXMLDocument**)dscd forStudy:(id)study
{
   return -1;
}



+(long)encloseXMLDocument:(NSXMLDocument**)xml intoDCM:(NSMutableData**)dcmData forStudy:(id)study
{
   return -1;
}


@end
