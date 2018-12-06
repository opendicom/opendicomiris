#import <Cocoa/Cocoa.h>

@class DicomSeries, DicomImage;

@interface DicomStudy : NSManagedObject
{
	BOOL isHidden;
	NSNumber *dicomTime;
    NSUInteger _numberOfImagesWhenCachedModalities;
	NSString *cachedModalites;
    BOOL reentry;
}

//database outline
@property(nonatomic, retain) NSString* name;
@property(nonatomic, retain) NSString* patientID;
@property(nonatomic, retain) NSDate*   dateOfBirth;
@property(nonatomic, retain) NSString* studyName;
@property(nonatomic, retain) NSString* modality;
@property(nonatomic, retain) NSSet*    series;
@property(nonatomic, retain) NSNumber* numberOfImages;
@property(nonatomic, retain) NSDate*   date;
@property(nonatomic, retain) NSString* accessionNumber;
@property(nonatomic, retain) NSString* institutionName;
@property(nonatomic, retain) NSString* referringPhysician;
@property(nonatomic, retain) NSString* performingPhysician;
@property(nonatomic, retain) NSString* dictateURL;
@property(nonatomic, retain) NSString* reportURL;
@property(nonatomic, retain) NSString* id;
@property(nonatomic, retain) NSString* comment;
@property(nonatomic, retain) NSString* patientSex;
@property(nonatomic, retain) NSNumber* stateText;
@property(nonatomic, retain) NSDate*   dateAdded;
//not as column
@property(nonatomic, retain) NSDate*   dateOpened;
@property(nonatomic, retain) NSNumber* expanded;
@property(nonatomic, retain) NSNumber* hasDICOM;
@property(nonatomic, retain) NSNumber* lockedStudy;
@property(nonatomic, retain) NSString* patientUID;
@property(nonatomic, retain) NSString* studyInstanceUID;
@property(nonatomic, retain) NSData*   windowsState;
@property(nonatomic, retain) NSSet* albums;
@property(nonatomic, retain) NSString* comment2;
@property(nonatomic, retain) NSString* comment3;
@property(nonatomic, retain) NSString* comment4;

+ (NSRecursiveLock*) dbModifyLock;
+ (NSString*) soundex: (NSString*) s;
- (NSString*) soundex;
+ (NSString*) yearOldFromDateOfBirth: (NSDate*) dateOfBirth;
+ (NSString*) yearOldAcquisition:(NSDate*) acquisitionDate FromDateOfBirth: (NSDate*) dateOfBirth;
+ (BOOL) displaySeriesWithSOPClassUID: (NSString*) uid andSeriesDescription: (NSString*) description;
- (NSNumber*) noFiles;
- (NSSet*) paths;
- (NSSet*) keyImages;
- (NSSet*) images;
- (NSNumber*) rawNoFiles;
- (NSString*) modalities;
+ (NSString*) displayedModalitiesForSeries: (NSArray*) seriesModalities;
- (NSArray*) imageSeries;
- (NSArray*) imageSeriesContainingPixels:(BOOL) pixels;
- (NSArray*) keyObjectSeries;
- (NSArray*) keyObjects;
- (NSArray*) presentationStateSeries;
- (NSArray*) waveFormSeries;
- (NSString*) roiPathForImage: (DicomImage*) image inArray: (NSArray*) roisArray;
- (NSString*) roiPathForImage: (DicomImage*) image;
- (DicomImage*) roiForImage: (DicomImage*) image inArray: (NSArray*) roisArray;
- (DicomSeries*) roiSRSeries;
- (DicomSeries*) reportSRSeries;
- (DicomImage*) windowsStateImage;
- (DicomSeries*) windowsStateSRSeries;
- (DicomImage*) reportImage;
- (DicomImage*) annotationsSRImage;
- (void) archiveReportAsDICOMSR;
- (void) archiveAnnotationsAsDICOMSR;
- (void) archiveWindowsStateAsDICOMSR;
- (NSArray*) allWindowsStateSRSeries;
- (BOOL) isHidden;
- (BOOL) isDistant;
- (void) setHidden: (BOOL) h;
- (NSNumber*) noFilesExcludingMultiFrames;
- (NSDictionary*) annotationsAsDictionary;
- (void) applyAnnotationsFromDictionary: (NSDictionary*) rootDict;
- (void) reapplyAnnotationsFromDICOMSR;
- (NSComparisonResult) compareName:(DicomStudy*)study;
- (NSArray*) roiImages;
- (NSNumber*) dicomTime;
- (NSArray*) generateDICOMSCImagesForKeyImages: (BOOL) keyImages andROIImages: (BOOL) ROIImages;
@end

@interface DicomStudy (CoreDataGeneratedAccessors)

- (void) addAlbumsObject:(NSManagedObject*) value;
- (void) removeAlbumsObject:(NSManagedObject*) value;
- (void) addAlbums:(NSSet*) value;
- (void) removeAlbums:(NSSet*) value;

- (void) addSeriesObject:(DicomSeries*) value;
- (void) removeSeriesObject:(DicomSeries*) value;
- (void) addSeries:(NSSet*) value;
- (void) removeSeries:(NSSet*) value;

- (NSArray*) imagesForKeyImages:(BOOL) keyImages andForROIs:(BOOL)alsoImagesWithROIs;

+ (NSString*) scrambleString: (NSString*) t;

@end

