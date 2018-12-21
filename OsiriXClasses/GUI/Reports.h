#import <Foundation/Foundation.h>
#import <Carbon/Carbon.h>

@interface Reports : NSObject
{
	NSMutableString *templateName;
}

+ (NSString*) getUniqueFilename:(id) study;
+ (NSString*) getOldUniqueFilename:(NSManagedObject*) study;

- (BOOL)createNewReport:(NSManagedObject*)study destination:(NSString*)path type:(int)type;

- (void)searchAndReplaceFieldsFromStudy:(NSManagedObject*)aStudy inString:(NSMutableString*)aString;
- (BOOL) createNewOpenDocumentReportForStudy:(NSManagedObject*)aStudy toDestinationPath:(NSString*)aPath;
- (NSMutableString *)templateName;
- (void)setTemplateName:(NSString *)aName;

@end
