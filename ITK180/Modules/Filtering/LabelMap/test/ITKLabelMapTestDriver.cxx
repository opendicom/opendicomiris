#include <ctype.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "itkTestDriverIncludeRequiredIOFactories.h"



/* Forward declare test functions. */
int itkAggregateLabelMapFilterTest(int, char*[]);
int itkAttributeKeepNObjectsLabelMapFilterTest1(int, char*[]);
int itkAttributeLabelObjectAccessorsTest1(int, char*[]);
int itkAttributeOpeningLabelMapFilterTest1(int, char*[]);
int itkAttributePositionLabelMapFilterTest1(int, char*[]);
int itkAttributeRelabelLabelMapFilterTest1(int, char*[]);
int itkAttributeUniqueLabelMapFilterTest1(int, char*[]);
int itkAutoCropLabelMapFilterTest1(int, char*[]);
int itkAutoCropLabelMapFilterTest2(int, char*[]);
int itkBinaryFillholeImageFilterTest1(int, char*[]);
int itkBinaryGrindPeakImageFilterTest1(int, char*[]);
int itkBinaryImageToLabelMapFilterTest(int, char*[]);
int itkBinaryImageToShapeLabelMapFilterTest1(int, char*[]);
int itkBinaryImageToStatisticsLabelMapFilterTest1(int, char*[]);
int itkBinaryReconstructionByDilationImageFilterTest(int, char*[]);
int itkBinaryReconstructionByErosionImageFilterTest(int, char*[]);
int itkBinaryReconstructionLabelMapFilterTest(int, char*[]);
int itkBinaryShapeKeepNObjectsImageFilterTest1(int, char*[]);
int itkBinaryShapeOpeningImageFilterTest1(int, char*[]);
int itkBinaryStatisticsKeepNObjectsImageFilterTest1(int, char*[]);
int itkBinaryStatisticsOpeningImageFilterTest1(int, char*[]);
int itkChangeLabelLabelMapFilterTest(int, char*[]);
int itkChangeRegionLabelMapFilterTest1(int, char*[]);
int itkConvertLabelMapFilterTest1(int, char*[]);
int itkCropLabelMapFilterTest1(int, char*[]);
int itkLabelImageToLabelMapFilterTest(int, char*[]);
int itkLabelImageToShapeLabelMapFilterTest1(int, char*[]);
int itkLabelImageToStatisticsLabelMapFilterTest1(int, char*[]);
int itkLabelMapFilterTest(int, char*[]);
int itkLabelMapMaskImageFilterTest(int, char*[]);
int itkLabelMapTest(int, char*[]);
int itkLabelMapTest2(int, char*[]);
int itkLabelMapToAttributeImageFilterTest1(int, char*[]);
int itkLabelMapToBinaryImageFilterTest(int, char*[]);
int itkLabelMapToLabelImageFilterTest(int, char*[]);
int itkLabelObjectLineComparatorTest(int, char*[]);
int itkLabelObjectLineTest(int, char*[]);
int itkLabelObjectTest(int, char*[]);
int itkLabelSelectionLabelMapFilterTest(int, char*[]);
int itkLabelShapeKeepNObjectsImageFilterTest1(int, char*[]);
int itkLabelShapeOpeningImageFilterTest1(int, char*[]);
int itkLabelStatisticsKeepNObjectsImageFilterTest1(int, char*[]);
int itkLabelStatisticsOpeningImageFilterTest1(int, char*[]);
int itkLabelUniqueLabelMapFilterTest1(int, char*[]);
int itkMergeLabelMapFilterTest1(int, char*[]);
int itkObjectByObjectLabelMapFilterTest(int, char*[]);
int itkPadLabelMapFilterTest1(int, char*[]);
int itkRegionFromReferenceLabelMapFilterTest1(int, char*[]);
int itkRelabelLabelMapFilterTest1(int, char*[]);
int itkShapeKeepNObjectsLabelMapFilterTest1(int, char*[]);
int itkShapeLabelObjectAccessorsTest1(int, char*[]);
int itkShapeOpeningLabelMapFilterTest1(int, char*[]);
int itkShapePositionLabelMapFilterTest1(int, char*[]);
int itkShapeRelabelImageFilterTest1(int, char*[]);
int itkShapeRelabelLabelMapFilterTest1(int, char*[]);
int itkShapeUniqueLabelMapFilterTest1(int, char*[]);
int itkShiftLabelObjectTest(int, char*[]);
int itkShiftScaleLabelMapFilterTest1(int, char*[]);
int itkStatisticsKeepNObjectsLabelMapFilterTest1(int, char*[]);
int itkStatisticsOpeningLabelMapFilterTest1(int, char*[]);
int itkStatisticsPositionLabelMapFilterTest1(int, char*[]);
int itkStatisticsRelabelImageFilterTest1(int, char*[]);
int itkStatisticsRelabelLabelMapFilterTest1(int, char*[]);
int itkStatisticsUniqueLabelMapFilterTest1(int, char*[]);


/* Create map.  */

typedef int (*MainFuncPointer)(int , char*[]);
typedef struct
{
  const char* name;
  MainFuncPointer func;
} functionMapEntry;

functionMapEntry cmakeGeneratedFunctionMapEntries[] = {
    {
    "itkAggregateLabelMapFilterTest",
    itkAggregateLabelMapFilterTest
  },
  {
    "itkAttributeKeepNObjectsLabelMapFilterTest1",
    itkAttributeKeepNObjectsLabelMapFilterTest1
  },
  {
    "itkAttributeLabelObjectAccessorsTest1",
    itkAttributeLabelObjectAccessorsTest1
  },
  {
    "itkAttributeOpeningLabelMapFilterTest1",
    itkAttributeOpeningLabelMapFilterTest1
  },
  {
    "itkAttributePositionLabelMapFilterTest1",
    itkAttributePositionLabelMapFilterTest1
  },
  {
    "itkAttributeRelabelLabelMapFilterTest1",
    itkAttributeRelabelLabelMapFilterTest1
  },
  {
    "itkAttributeUniqueLabelMapFilterTest1",
    itkAttributeUniqueLabelMapFilterTest1
  },
  {
    "itkAutoCropLabelMapFilterTest1",
    itkAutoCropLabelMapFilterTest1
  },
  {
    "itkAutoCropLabelMapFilterTest2",
    itkAutoCropLabelMapFilterTest2
  },
  {
    "itkBinaryFillholeImageFilterTest1",
    itkBinaryFillholeImageFilterTest1
  },
  {
    "itkBinaryGrindPeakImageFilterTest1",
    itkBinaryGrindPeakImageFilterTest1
  },
  {
    "itkBinaryImageToLabelMapFilterTest",
    itkBinaryImageToLabelMapFilterTest
  },
  {
    "itkBinaryImageToShapeLabelMapFilterTest1",
    itkBinaryImageToShapeLabelMapFilterTest1
  },
  {
    "itkBinaryImageToStatisticsLabelMapFilterTest1",
    itkBinaryImageToStatisticsLabelMapFilterTest1
  },
  {
    "itkBinaryReconstructionByDilationImageFilterTest",
    itkBinaryReconstructionByDilationImageFilterTest
  },
  {
    "itkBinaryReconstructionByErosionImageFilterTest",
    itkBinaryReconstructionByErosionImageFilterTest
  },
  {
    "itkBinaryReconstructionLabelMapFilterTest",
    itkBinaryReconstructionLabelMapFilterTest
  },
  {
    "itkBinaryShapeKeepNObjectsImageFilterTest1",
    itkBinaryShapeKeepNObjectsImageFilterTest1
  },
  {
    "itkBinaryShapeOpeningImageFilterTest1",
    itkBinaryShapeOpeningImageFilterTest1
  },
  {
    "itkBinaryStatisticsKeepNObjectsImageFilterTest1",
    itkBinaryStatisticsKeepNObjectsImageFilterTest1
  },
  {
    "itkBinaryStatisticsOpeningImageFilterTest1",
    itkBinaryStatisticsOpeningImageFilterTest1
  },
  {
    "itkChangeLabelLabelMapFilterTest",
    itkChangeLabelLabelMapFilterTest
  },
  {
    "itkChangeRegionLabelMapFilterTest1",
    itkChangeRegionLabelMapFilterTest1
  },
  {
    "itkConvertLabelMapFilterTest1",
    itkConvertLabelMapFilterTest1
  },
  {
    "itkCropLabelMapFilterTest1",
    itkCropLabelMapFilterTest1
  },
  {
    "itkLabelImageToLabelMapFilterTest",
    itkLabelImageToLabelMapFilterTest
  },
  {
    "itkLabelImageToShapeLabelMapFilterTest1",
    itkLabelImageToShapeLabelMapFilterTest1
  },
  {
    "itkLabelImageToStatisticsLabelMapFilterTest1",
    itkLabelImageToStatisticsLabelMapFilterTest1
  },
  {
    "itkLabelMapFilterTest",
    itkLabelMapFilterTest
  },
  {
    "itkLabelMapMaskImageFilterTest",
    itkLabelMapMaskImageFilterTest
  },
  {
    "itkLabelMapTest",
    itkLabelMapTest
  },
  {
    "itkLabelMapTest2",
    itkLabelMapTest2
  },
  {
    "itkLabelMapToAttributeImageFilterTest1",
    itkLabelMapToAttributeImageFilterTest1
  },
  {
    "itkLabelMapToBinaryImageFilterTest",
    itkLabelMapToBinaryImageFilterTest
  },
  {
    "itkLabelMapToLabelImageFilterTest",
    itkLabelMapToLabelImageFilterTest
  },
  {
    "itkLabelObjectLineComparatorTest",
    itkLabelObjectLineComparatorTest
  },
  {
    "itkLabelObjectLineTest",
    itkLabelObjectLineTest
  },
  {
    "itkLabelObjectTest",
    itkLabelObjectTest
  },
  {
    "itkLabelSelectionLabelMapFilterTest",
    itkLabelSelectionLabelMapFilterTest
  },
  {
    "itkLabelShapeKeepNObjectsImageFilterTest1",
    itkLabelShapeKeepNObjectsImageFilterTest1
  },
  {
    "itkLabelShapeOpeningImageFilterTest1",
    itkLabelShapeOpeningImageFilterTest1
  },
  {
    "itkLabelStatisticsKeepNObjectsImageFilterTest1",
    itkLabelStatisticsKeepNObjectsImageFilterTest1
  },
  {
    "itkLabelStatisticsOpeningImageFilterTest1",
    itkLabelStatisticsOpeningImageFilterTest1
  },
  {
    "itkLabelUniqueLabelMapFilterTest1",
    itkLabelUniqueLabelMapFilterTest1
  },
  {
    "itkMergeLabelMapFilterTest1",
    itkMergeLabelMapFilterTest1
  },
  {
    "itkObjectByObjectLabelMapFilterTest",
    itkObjectByObjectLabelMapFilterTest
  },
  {
    "itkPadLabelMapFilterTest1",
    itkPadLabelMapFilterTest1
  },
  {
    "itkRegionFromReferenceLabelMapFilterTest1",
    itkRegionFromReferenceLabelMapFilterTest1
  },
  {
    "itkRelabelLabelMapFilterTest1",
    itkRelabelLabelMapFilterTest1
  },
  {
    "itkShapeKeepNObjectsLabelMapFilterTest1",
    itkShapeKeepNObjectsLabelMapFilterTest1
  },
  {
    "itkShapeLabelObjectAccessorsTest1",
    itkShapeLabelObjectAccessorsTest1
  },
  {
    "itkShapeOpeningLabelMapFilterTest1",
    itkShapeOpeningLabelMapFilterTest1
  },
  {
    "itkShapePositionLabelMapFilterTest1",
    itkShapePositionLabelMapFilterTest1
  },
  {
    "itkShapeRelabelImageFilterTest1",
    itkShapeRelabelImageFilterTest1
  },
  {
    "itkShapeRelabelLabelMapFilterTest1",
    itkShapeRelabelLabelMapFilterTest1
  },
  {
    "itkShapeUniqueLabelMapFilterTest1",
    itkShapeUniqueLabelMapFilterTest1
  },
  {
    "itkShiftLabelObjectTest",
    itkShiftLabelObjectTest
  },
  {
    "itkShiftScaleLabelMapFilterTest1",
    itkShiftScaleLabelMapFilterTest1
  },
  {
    "itkStatisticsKeepNObjectsLabelMapFilterTest1",
    itkStatisticsKeepNObjectsLabelMapFilterTest1
  },
  {
    "itkStatisticsOpeningLabelMapFilterTest1",
    itkStatisticsOpeningLabelMapFilterTest1
  },
  {
    "itkStatisticsPositionLabelMapFilterTest1",
    itkStatisticsPositionLabelMapFilterTest1
  },
  {
    "itkStatisticsRelabelImageFilterTest1",
    itkStatisticsRelabelImageFilterTest1
  },
  {
    "itkStatisticsRelabelLabelMapFilterTest1",
    itkStatisticsRelabelLabelMapFilterTest1
  },
  {
    "itkStatisticsUniqueLabelMapFilterTest1",
    itkStatisticsUniqueLabelMapFilterTest1
  },

  {0,0}
};

/* Allocate and create a lowercased copy of string
   (note that it has to be free'd manually) */

char* lowercase(const char *string)
{
  char *new_string, *p;

#ifdef __cplusplus
  new_string = static_cast<char *>(malloc(sizeof(char) *
    static_cast<size_t>(strlen(string) + 1)));
#else
  new_string = (char *)(malloc(sizeof(char) * (size_t)(strlen(string) + 1)));
#endif

  if (!new_string)
    {
    return 0;
    }
  strcpy(new_string, string);
  p = new_string;
  while (*p != 0)
    {
#ifdef __cplusplus
    *p = static_cast<char>(tolower(*p));
#else
    *p = (char)(tolower(*p));
#endif

    ++p;
    }
  return new_string;
}

int main(int ac, char *av[])
{
  int i, NumTests, testNum, partial_match;
  char *arg, *test_name;
  int count;
  int testToRun = -1;

  ProcessArgumentsAndRegisterRequiredFactories(&ac, &av);

    
  for(count =0; cmakeGeneratedFunctionMapEntries[count].name != 0; count++)
    {
    }
  NumTests = count;
  /* If no test name was given */
  /* process command line with user function.  */
  if (ac < 2)
    {
    /* Ask for a test.  */
    printf("Available tests:\n");
    for (i =0; i < NumTests; ++i)
      {
      printf("%3d. %s\n", i, cmakeGeneratedFunctionMapEntries[i].name);
      }
    printf("To run a test, enter the test number: ");
    fflush(stdout);
    testNum = 0;
    if( scanf("%d", &testNum) != 1 )
      {
      printf("Couldn't parse that input as a number\n");
      return -1;
      }
    if (testNum >= NumTests)
      {
      printf("%3d is an invalid test number.\n", testNum);
      return -1;
      }
    testToRun = testNum;
    ac--;
    av++;
    }
  partial_match = 0;
  arg = 0;
  /* If partial match is requested.  */
  if(testToRun == -1 && ac > 1)
    {
    partial_match = (strcmp(av[1], "-R") == 0) ? 1 : 0;
    }
  if (partial_match && ac < 3)
    {
    printf("-R needs an additional parameter.\n");
    return -1;
    }
  if(testToRun == -1)
    {
    arg = lowercase(av[1 + partial_match]);
    }
  for (i =0; i < NumTests && testToRun == -1; ++i)
    {
    test_name = lowercase(cmakeGeneratedFunctionMapEntries[i].name);
    if (partial_match && strstr(test_name, arg) != NULL)
      {
      testToRun = i;
      ac -=2;
      av += 2;
      }
    else if (!partial_match && strcmp(test_name, arg) == 0)
      {
      testToRun = i;
      ac--;
      av++;
      }
    free(test_name);
    }
  if(arg)
    {
    free(arg);
    }
  if(testToRun != -1)
    {
    int result;
#include "itkTestDriverBeforeTest.inc"
    result = (*cmakeGeneratedFunctionMapEntries[testToRun].func)(ac, av);
#include "itkTestDriverAfterTest.inc"
    return result;
    }
  
  
  /* Nothing was run, display the test names.  */
  printf("Available tests:\n");
  for (i =0; i < NumTests; ++i)
    {
    printf("%3d. %s\n", i, cmakeGeneratedFunctionMapEntries[i].name);
    }
  printf("Failed: %s is an invalid test name.\n", av[1]);
  
  return -1;
}
