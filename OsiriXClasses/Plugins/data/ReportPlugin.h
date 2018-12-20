#import "DatabasePlugin.h"

@interface ReportPlugin : DatabasePlugin {
}


#pragma mark to subclass
-(long)reportEditorWithMenuName:(NSString*)menuName ForStudy:(id)study;
-(long)resetReportEditorForStudy:(id)study;
-(long)generateReportForStudy:(id)study;


+(long)convertReportToPDF:(NSMutableData**)pdfData forStudy:(id)study;
+(long)enclosePDF:(NSMutableData**)pdfData intoDCM:(NSMutableData**)dcmData forStudy:(id)study;
+(long)enclosePDF:(NSMutableData**)pdfData intoCDA:(NSXMLDocument**)cda forStudy:(id)study;

+(long)convertReportToCDA:(NSXMLDocument**)cda forStudy:(id)study;
+(long)encloseCDA:(NSXMLDocument**)cda intoDSCD:(NSXMLDocument**)dscd forStudy:(id)study;

+(long)encloseXMLDocument:(NSXMLDocument**)xml intoDCM:(NSMutableData**)dcmData forStudy:(id)study;
@end
