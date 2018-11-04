#include <ctype.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "itkTestDriverIncludeRequiredIOFactories.h"



/* Forward declare test functions. */
int itkBasicArchitectureTest(int, char*[]);
int itkBSplineScatteredDataPointSetToImageFilterTest(int, char*[]);
int itkBSplineScatteredDataPointSetToImageFilterTest2(int, char*[]);
int itkBSplineScatteredDataPointSetToImageFilterTest3(int, char*[]);
int itkBSplineScatteredDataPointSetToImageFilterTest4(int, char*[]);
int itkBSplineControlPointImageFilterTest(int, char*[]);
int itkBSplineControlPointImageFunctionTest(int, char*[]);
int itkChangeInformationImageFilterTest(int, char*[]);
int itkConstantPadImageTest(int, char*[]);
int itkCoxDeBoorBSplineKernelFunctionTest(int, char*[]);
int itkCoxDeBoorBSplineKernelFunctionTest2(int, char*[]);
int itkCyclicReferences(int, char*[]);
int itkCyclicShiftImageFilterTest(int, char*[]);
int itkInterpolateImagePointsFilterTest(int, char*[]);
int itkCropImageFilterTest(int, char*[]);
int itkCropImageFilter3DTest(int, char*[]);
int itkFlipImageFilterTest(int, char*[]);
int itkExpandImageFilterTest(int, char*[]);
int itkRegionOfInterestImageFilterTest(int, char*[]);
int itkBSplineUpsampleImageFilterTest(int, char*[]);
int itkBSplineResampleImageFilterTest(int, char*[]);
int itkBSplineDownsampleImageFilterTest(int, char*[]);
int itkTileImageFilterTest(int, char*[]);
int itkInterpolateImageFilterTest(int, char*[]);
int itkPasteImageFilterTest(int, char*[]);
int itkVectorResampleImageFilterTest(int, char*[]);
int itkPermuteAxesImageFilterTest(int, char*[]);
int itkOrientedImage2DTest(int, char*[]);
int itkOrientedImage3DTest(int, char*[]);
int itkOrientedImageAdaptorTest(int, char*[]);
int itkOrientedImageProfileTest1(int, char*[]);
int itkOrientedImageProfileTest2(int, char*[]);
int itkOrientedImageProfileTest3(int, char*[]);
int itkOrientImageFilterTest(int, char*[]);
int itkOrientImageFilterTest2(int, char*[]);
int itkWarpImageFilterTest(int, char*[]);
int itkWarpImageFilterTest2(int, char*[]);
int itkWarpVectorImageFilterTest(int, char*[]);
int itkWrapPadImageTest(int, char*[]);
int itkMirrorPadImageTest(int, char*[]);
int itkResampleImageTest(int, char*[]);
int itkResampleImageTest2(int, char*[]);
int itkResampleImageTest3(int, char*[]);
int itkResampleImageTest4(int, char*[]);
int itkResampleImageTest5(int, char*[]);
int itkResampleImageTest6(int, char*[]);
int itkResamplePhasedArray3DSpecialCoordinatesImageTest(int, char*[]);
int itkPushPopTileImageFilterTest(int, char*[]);
int itkShrinkImagePreserveObjectPhysicalLocations(int, char*[]);
int itkShrinkImageStreamingTest(int, char*[]);
int itkShrinkImageTest(int, char*[]);
int itkZeroFluxNeumannPadImageFilterTest(int, char*[]);
int itkSliceBySliceImageFilterTest(int, char*[]);
int itkPadImageFilterTest(int, char*[]);


/* Create map.  */

typedef int (*MainFuncPointer)(int , char*[]);
typedef struct
{
  const char* name;
  MainFuncPointer func;
} functionMapEntry;

functionMapEntry cmakeGeneratedFunctionMapEntries[] = {
    {
    "itkBasicArchitectureTest",
    itkBasicArchitectureTest
  },
  {
    "itkBSplineScatteredDataPointSetToImageFilterTest",
    itkBSplineScatteredDataPointSetToImageFilterTest
  },
  {
    "itkBSplineScatteredDataPointSetToImageFilterTest2",
    itkBSplineScatteredDataPointSetToImageFilterTest2
  },
  {
    "itkBSplineScatteredDataPointSetToImageFilterTest3",
    itkBSplineScatteredDataPointSetToImageFilterTest3
  },
  {
    "itkBSplineScatteredDataPointSetToImageFilterTest4",
    itkBSplineScatteredDataPointSetToImageFilterTest4
  },
  {
    "itkBSplineControlPointImageFilterTest",
    itkBSplineControlPointImageFilterTest
  },
  {
    "itkBSplineControlPointImageFunctionTest",
    itkBSplineControlPointImageFunctionTest
  },
  {
    "itkChangeInformationImageFilterTest",
    itkChangeInformationImageFilterTest
  },
  {
    "itkConstantPadImageTest",
    itkConstantPadImageTest
  },
  {
    "itkCoxDeBoorBSplineKernelFunctionTest",
    itkCoxDeBoorBSplineKernelFunctionTest
  },
  {
    "itkCoxDeBoorBSplineKernelFunctionTest2",
    itkCoxDeBoorBSplineKernelFunctionTest2
  },
  {
    "itkCyclicReferences",
    itkCyclicReferences
  },
  {
    "itkCyclicShiftImageFilterTest",
    itkCyclicShiftImageFilterTest
  },
  {
    "itkInterpolateImagePointsFilterTest",
    itkInterpolateImagePointsFilterTest
  },
  {
    "itkCropImageFilterTest",
    itkCropImageFilterTest
  },
  {
    "itkCropImageFilter3DTest",
    itkCropImageFilter3DTest
  },
  {
    "itkFlipImageFilterTest",
    itkFlipImageFilterTest
  },
  {
    "itkExpandImageFilterTest",
    itkExpandImageFilterTest
  },
  {
    "itkRegionOfInterestImageFilterTest",
    itkRegionOfInterestImageFilterTest
  },
  {
    "itkBSplineUpsampleImageFilterTest",
    itkBSplineUpsampleImageFilterTest
  },
  {
    "itkBSplineResampleImageFilterTest",
    itkBSplineResampleImageFilterTest
  },
  {
    "itkBSplineDownsampleImageFilterTest",
    itkBSplineDownsampleImageFilterTest
  },
  {
    "itkTileImageFilterTest",
    itkTileImageFilterTest
  },
  {
    "itkInterpolateImageFilterTest",
    itkInterpolateImageFilterTest
  },
  {
    "itkPasteImageFilterTest",
    itkPasteImageFilterTest
  },
  {
    "itkVectorResampleImageFilterTest",
    itkVectorResampleImageFilterTest
  },
  {
    "itkPermuteAxesImageFilterTest",
    itkPermuteAxesImageFilterTest
  },
  {
    "itkOrientedImage2DTest",
    itkOrientedImage2DTest
  },
  {
    "itkOrientedImage3DTest",
    itkOrientedImage3DTest
  },
  {
    "itkOrientedImageAdaptorTest",
    itkOrientedImageAdaptorTest
  },
  {
    "itkOrientedImageProfileTest1",
    itkOrientedImageProfileTest1
  },
  {
    "itkOrientedImageProfileTest2",
    itkOrientedImageProfileTest2
  },
  {
    "itkOrientedImageProfileTest3",
    itkOrientedImageProfileTest3
  },
  {
    "itkOrientImageFilterTest",
    itkOrientImageFilterTest
  },
  {
    "itkOrientImageFilterTest2",
    itkOrientImageFilterTest2
  },
  {
    "itkWarpImageFilterTest",
    itkWarpImageFilterTest
  },
  {
    "itkWarpImageFilterTest2",
    itkWarpImageFilterTest2
  },
  {
    "itkWarpVectorImageFilterTest",
    itkWarpVectorImageFilterTest
  },
  {
    "itkWrapPadImageTest",
    itkWrapPadImageTest
  },
  {
    "itkMirrorPadImageTest",
    itkMirrorPadImageTest
  },
  {
    "itkResampleImageTest",
    itkResampleImageTest
  },
  {
    "itkResampleImageTest2",
    itkResampleImageTest2
  },
  {
    "itkResampleImageTest3",
    itkResampleImageTest3
  },
  {
    "itkResampleImageTest4",
    itkResampleImageTest4
  },
  {
    "itkResampleImageTest5",
    itkResampleImageTest5
  },
  {
    "itkResampleImageTest6",
    itkResampleImageTest6
  },
  {
    "itkResamplePhasedArray3DSpecialCoordinatesImageTest",
    itkResamplePhasedArray3DSpecialCoordinatesImageTest
  },
  {
    "itkPushPopTileImageFilterTest",
    itkPushPopTileImageFilterTest
  },
  {
    "itkShrinkImagePreserveObjectPhysicalLocations",
    itkShrinkImagePreserveObjectPhysicalLocations
  },
  {
    "itkShrinkImageStreamingTest",
    itkShrinkImageStreamingTest
  },
  {
    "itkShrinkImageTest",
    itkShrinkImageTest
  },
  {
    "itkZeroFluxNeumannPadImageFilterTest",
    itkZeroFluxNeumannPadImageFilterTest
  },
  {
    "itkSliceBySliceImageFilterTest",
    itkSliceBySliceImageFilterTest
  },
  {
    "itkPadImageFilterTest",
    itkPadImageFilterTest
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
