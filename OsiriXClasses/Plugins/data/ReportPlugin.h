#import "DatabasePlugin.h"

@interface ReportPlugin : DatabasePlugin {
}

//object=sender
//currentStudy obtained through DatabasePlugin -currentStudy
-(long)execute:(id)object;//open editor with template sender object for current study

#pragma mark to subclass
-(long)reset:(id)object;//reset editor for current study
-(long)generateReport:(id)object;//finalizes a document based on the editor


+(long)convertReportToPDF:(NSMutableData**)pdfData forStudy:(id)study;
+(long)enclosePDF:(NSMutableData**)pdfData intoDCM:(NSMutableData**)dcmData forStudy:(id)study;
+(long)enclosePDF:(NSMutableData**)pdfData intoCDA:(NSXMLDocument**)cda forStudy:(id)study;

+(long)convertReportToCDA:(NSXMLDocument**)cda forStudy:(id)study;
+(long)encloseCDA:(NSXMLDocument**)cda intoDSCD:(NSXMLDocument**)dscd forStudy:(id)study;

+(long)encloseXMLDocument:(NSXMLDocument**)xml intoDCM:(NSMutableData**)dcmData forStudy:(id)study;
@end
