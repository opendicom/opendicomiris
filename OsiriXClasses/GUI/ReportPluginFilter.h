#import <Cocoa/Cocoa.h>
#import "PluginFilter.h"

@interface ReportPluginFilter : PluginFilter {

}

- (BOOL)createReportForStudy:(id)study;
- (BOOL)deleteReportForStudy:(id)study;

@end
