#include <ctype.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "itkTestDriverIncludeRequiredIOFactories.h"



/* Forward declare test functions. */
int itkBSplineTransformParametersAdaptorTest(int, char*[]);
int itkDisplacementFieldTransformParametersAdaptorTest(int, char*[]);
int itkBSplineSmoothingOnUpdateDisplacementFieldTransformParametersAdaptorTest(int, char*[]);
int itkGaussianSmoothingOnUpdateDisplacementFieldTransformParametersAdaptorTest(int, char*[]);
int itkCenteredTransformInitializerTest(int, char*[]);
int itkCenteredVersorTransformInitializerTest(int, char*[]);
int itkMultiResolutionImageRegistrationMethodTest_1(int, char*[]);
int itkMultiResolutionImageRegistrationMethodTest_2(int, char*[]);
int itkImageRegistrationMethodTest_10(int, char*[]);
int itkImageRegistrationMethodTest_11(int, char*[]);
int itkImageRegistrationMethodTest_12(int, char*[]);
int itkImageRegistrationMethodTest_13(int, char*[]);
int itkImageRegistrationMethodTest_14(int, char*[]);
int itkImageRegistrationMethodTest_15(int, char*[]);
int itkImageRegistrationMethodTest_16(int, char*[]);
int itkMeanSquaresPointSetToImageMetricTest(int, char*[]);
int itkGradientDifferenceImageToImageMetricTest(int, char*[]);
int itkHistogramImageToImageMetricTest(int, char*[]);
int itkMutualInformationHistogramImageToImageMetricTest(int, char*[]);
int itkMeanReciprocalSquareDifferencePointSetToImageMetricTest(int, char*[]);
int itkMultiResolutionImageRegistrationMethodTest(int, char*[]);
int itkCompareHistogramImageToImageMetricTest(int, char*[]);
int itkMeanSquaresHistogramImageToImageMetricTest(int, char*[]);
int itkImageRegistrationMethodTest(int, char*[]);
int itkCorrelationCoefficientHistogramImageToImageMetricTest(int, char*[]);
int itkNormalizedCorrelationPointSetToImageMetricTest(int, char*[]);
int itkKullbackLeiblerCompareHistogramImageToImageMetricTest(int, char*[]);
int itkNormalizedMutualInformationHistogramImageToImageMetricTest(int, char*[]);
int itkPointSetToSpatialObjectDemonsRegistrationTest(int, char*[]);
int itkPointSetToImageRegistrationTest_1(int, char*[]);
int itkPointsLocatorTest(int, char*[]);
int itkKappaStatisticImageToImageMetricTest(int, char*[]);
int itkMattesMutualInformationImageToImageMetricTest(int, char*[]);
int itkMatchCardinalityImageToImageMetricTest(int, char*[]);
int itkMultiResolutionPyramidImageFilterTest(int, char*[]);
int itkImageRegistrationMethodTest_1(int, char*[]);
int itkImageRegistrationMethodTest_2(int, char*[]);
int itkImageRegistrationMethodTest_3(int, char*[]);
int itkImageRegistrationMethodTest_4(int, char*[]);
int itkImageRegistrationMethodTest_5(int, char*[]);
int itkImageRegistrationMethodTest_6(int, char*[]);
int itkImageRegistrationMethodTest_7(int, char*[]);
int itkImageRegistrationMethodTest_8(int, char*[]);
int itkImageRegistrationMethodTest_9(int, char*[]);
int itkRecursiveMultiResolutionPyramidImageFilterTest(int, char*[]);
int itkNormalizedCorrelationImageMetricTest(int, char*[]);
int itkMeanReciprocalSquareDifferenceImageMetricTest(int, char*[]);
int itkMeanSquaresImageMetricTest(int, char*[]);
int itkMutualInformationMetricTest(int, char*[]);
int itkPointSetToPointSetRegistrationTest(int, char*[]);
int itkSpatialObjectToImageRegistrationTest(int, char*[]);


/* Create map.  */

typedef int (*MainFuncPointer)(int , char*[]);
typedef struct
{
  const char* name;
  MainFuncPointer func;
} functionMapEntry;

functionMapEntry cmakeGeneratedFunctionMapEntries[] = {
    {
    "itkBSplineTransformParametersAdaptorTest",
    itkBSplineTransformParametersAdaptorTest
  },
  {
    "itkDisplacementFieldTransformParametersAdaptorTest",
    itkDisplacementFieldTransformParametersAdaptorTest
  },
  {
    "itkBSplineSmoothingOnUpdateDisplacementFieldTransformParametersAdaptorTest",
    itkBSplineSmoothingOnUpdateDisplacementFieldTransformParametersAdaptorTest
  },
  {
    "itkGaussianSmoothingOnUpdateDisplacementFieldTransformParametersAdaptorTest",
    itkGaussianSmoothingOnUpdateDisplacementFieldTransformParametersAdaptorTest
  },
  {
    "itkCenteredTransformInitializerTest",
    itkCenteredTransformInitializerTest
  },
  {
    "itkCenteredVersorTransformInitializerTest",
    itkCenteredVersorTransformInitializerTest
  },
  {
    "itkMultiResolutionImageRegistrationMethodTest_1",
    itkMultiResolutionImageRegistrationMethodTest_1
  },
  {
    "itkMultiResolutionImageRegistrationMethodTest_2",
    itkMultiResolutionImageRegistrationMethodTest_2
  },
  {
    "itkImageRegistrationMethodTest_10",
    itkImageRegistrationMethodTest_10
  },
  {
    "itkImageRegistrationMethodTest_11",
    itkImageRegistrationMethodTest_11
  },
  {
    "itkImageRegistrationMethodTest_12",
    itkImageRegistrationMethodTest_12
  },
  {
    "itkImageRegistrationMethodTest_13",
    itkImageRegistrationMethodTest_13
  },
  {
    "itkImageRegistrationMethodTest_14",
    itkImageRegistrationMethodTest_14
  },
  {
    "itkImageRegistrationMethodTest_15",
    itkImageRegistrationMethodTest_15
  },
  {
    "itkImageRegistrationMethodTest_16",
    itkImageRegistrationMethodTest_16
  },
  {
    "itkMeanSquaresPointSetToImageMetricTest",
    itkMeanSquaresPointSetToImageMetricTest
  },
  {
    "itkGradientDifferenceImageToImageMetricTest",
    itkGradientDifferenceImageToImageMetricTest
  },
  {
    "itkHistogramImageToImageMetricTest",
    itkHistogramImageToImageMetricTest
  },
  {
    "itkMutualInformationHistogramImageToImageMetricTest",
    itkMutualInformationHistogramImageToImageMetricTest
  },
  {
    "itkMeanReciprocalSquareDifferencePointSetToImageMetricTest",
    itkMeanReciprocalSquareDifferencePointSetToImageMetricTest
  },
  {
    "itkMultiResolutionImageRegistrationMethodTest",
    itkMultiResolutionImageRegistrationMethodTest
  },
  {
    "itkCompareHistogramImageToImageMetricTest",
    itkCompareHistogramImageToImageMetricTest
  },
  {
    "itkMeanSquaresHistogramImageToImageMetricTest",
    itkMeanSquaresHistogramImageToImageMetricTest
  },
  {
    "itkImageRegistrationMethodTest",
    itkImageRegistrationMethodTest
  },
  {
    "itkCorrelationCoefficientHistogramImageToImageMetricTest",
    itkCorrelationCoefficientHistogramImageToImageMetricTest
  },
  {
    "itkNormalizedCorrelationPointSetToImageMetricTest",
    itkNormalizedCorrelationPointSetToImageMetricTest
  },
  {
    "itkKullbackLeiblerCompareHistogramImageToImageMetricTest",
    itkKullbackLeiblerCompareHistogramImageToImageMetricTest
  },
  {
    "itkNormalizedMutualInformationHistogramImageToImageMetricTest",
    itkNormalizedMutualInformationHistogramImageToImageMetricTest
  },
  {
    "itkPointSetToSpatialObjectDemonsRegistrationTest",
    itkPointSetToSpatialObjectDemonsRegistrationTest
  },
  {
    "itkPointSetToImageRegistrationTest_1",
    itkPointSetToImageRegistrationTest_1
  },
  {
    "itkPointsLocatorTest",
    itkPointsLocatorTest
  },
  {
    "itkKappaStatisticImageToImageMetricTest",
    itkKappaStatisticImageToImageMetricTest
  },
  {
    "itkMattesMutualInformationImageToImageMetricTest",
    itkMattesMutualInformationImageToImageMetricTest
  },
  {
    "itkMatchCardinalityImageToImageMetricTest",
    itkMatchCardinalityImageToImageMetricTest
  },
  {
    "itkMultiResolutionPyramidImageFilterTest",
    itkMultiResolutionPyramidImageFilterTest
  },
  {
    "itkImageRegistrationMethodTest_1",
    itkImageRegistrationMethodTest_1
  },
  {
    "itkImageRegistrationMethodTest_2",
    itkImageRegistrationMethodTest_2
  },
  {
    "itkImageRegistrationMethodTest_3",
    itkImageRegistrationMethodTest_3
  },
  {
    "itkImageRegistrationMethodTest_4",
    itkImageRegistrationMethodTest_4
  },
  {
    "itkImageRegistrationMethodTest_5",
    itkImageRegistrationMethodTest_5
  },
  {
    "itkImageRegistrationMethodTest_6",
    itkImageRegistrationMethodTest_6
  },
  {
    "itkImageRegistrationMethodTest_7",
    itkImageRegistrationMethodTest_7
  },
  {
    "itkImageRegistrationMethodTest_8",
    itkImageRegistrationMethodTest_8
  },
  {
    "itkImageRegistrationMethodTest_9",
    itkImageRegistrationMethodTest_9
  },
  {
    "itkRecursiveMultiResolutionPyramidImageFilterTest",
    itkRecursiveMultiResolutionPyramidImageFilterTest
  },
  {
    "itkNormalizedCorrelationImageMetricTest",
    itkNormalizedCorrelationImageMetricTest
  },
  {
    "itkMeanReciprocalSquareDifferenceImageMetricTest",
    itkMeanReciprocalSquareDifferenceImageMetricTest
  },
  {
    "itkMeanSquaresImageMetricTest",
    itkMeanSquaresImageMetricTest
  },
  {
    "itkMutualInformationMetricTest",
    itkMutualInformationMetricTest
  },
  {
    "itkPointSetToPointSetRegistrationTest",
    itkPointSetToPointSetRegistrationTest
  },
  {
    "itkSpatialObjectToImageRegistrationTest",
    itkSpatialObjectToImageRegistrationTest
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
