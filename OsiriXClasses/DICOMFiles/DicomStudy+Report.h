#import "DicomStudy.h"

@interface DicomStudy (Report)

// report to pdf
+(void)transformReportAtPath:(NSString*)reportPath toPdfAtPath:(NSString*)outPdfPath;
-(void)saveReportAsPdfAtPath:(NSString*)path;
-(NSString*)saveReportAsPdfInTmp;

// pdf to dicom
+(void)transformPdfAtPath:(NSString*)pdfPath toDicomAtPath:(NSString*)outDicomPath usingSourceDicomAtPath:(NSString*)sourcePath;
-(void)transformPdfAtPath:(NSString*)pdfPath toDicomAtPath:(NSString*)outDicomPath;
-(void)saveReportAsDicomAtPath:(NSString*)path;
-(NSString*)saveReportAsDicomInTmp;

@end
