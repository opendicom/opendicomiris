#include <ctype.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "itkTestDriverIncludeRequiredIOFactories.h"



/* Forward declare test functions. */
int itkStatisticsImageFilterTest(int, char*[]);
int itkLabelStatisticsImageFilterTest(int, char*[]);
int itkSumProjectionImageFilterTest(int, char*[]);
int itkStandardDeviationProjectionImageFilterTest(int, char*[]);
int itkImageMomentsTest(int, char*[]);
int itkImageToHistogramFilterTest(int, char*[]);
int itkImageToHistogramFilterTest2(int, char*[]);
int itkImageToHistogramFilterTest3(int, char*[]);
int itkMinimumMaximumImageFilterTest(int, char*[]);
int itkImagePCAShapeModelEstimatorTest(int, char*[]);
int itkMaximumProjectionImageFilterTest2(int, char*[]);
int itkMaximumProjectionImageFilterTest3(int, char*[]);
int itkMinimumProjectionImageFilterTest(int, char*[]);
int itkMeanProjectionImageFilterTest(int, char*[]);
int itkImagePCADecompositionCalculatorTest(int, char*[]);
int itkMaximumProjectionImageFilterTest(int, char*[]);
int itkMedianProjectionImageFilterTest(int, char*[]);
int itkHistogramToEntropyImageFilterTest1(int, char*[]);
int itkHistogramToEntropyImageFilterTest2(int, char*[]);
int itkHistogramToIntensityImageFilterTest1(int, char*[]);
int itkHistogramToIntensityImageFilterTest2(int, char*[]);
int itkHistogramToLogProbabilityImageFilterTest1(int, char*[]);
int itkHistogramToLogProbabilityImageFilterTest2(int, char*[]);
int itkHistogramToProbabilityImageFilterTest1(int, char*[]);
int itkHistogramToProbabilityImageFilterTest2(int, char*[]);
int itkAccumulateImageFilterTest(int, char*[]);
int itkAdaptiveHistogramEqualizationImageFilterTest(int, char*[]);
int itkGetAverageSliceImageFilterTest(int, char*[]);
int itkBinaryProjectionImageFilterTest(int, char*[]);
int itkProjectionImageFilterTest(int, char*[]);
int itkLabelOverlapMeasuresImageFilterTest(int, char*[]);


/* Create map.  */

typedef int (*MainFuncPointer)(int , char*[]);
typedef struct
{
  const char* name;
  MainFuncPointer func;
} functionMapEntry;

functionMapEntry cmakeGeneratedFunctionMapEntries[] = {
    {
    "itkStatisticsImageFilterTest",
    itkStatisticsImageFilterTest
  },
  {
    "itkLabelStatisticsImageFilterTest",
    itkLabelStatisticsImageFilterTest
  },
  {
    "itkSumProjectionImageFilterTest",
    itkSumProjectionImageFilterTest
  },
  {
    "itkStandardDeviationProjectionImageFilterTest",
    itkStandardDeviationProjectionImageFilterTest
  },
  {
    "itkImageMomentsTest",
    itkImageMomentsTest
  },
  {
    "itkImageToHistogramFilterTest",
    itkImageToHistogramFilterTest
  },
  {
    "itkImageToHistogramFilterTest2",
    itkImageToHistogramFilterTest2
  },
  {
    "itkImageToHistogramFilterTest3",
    itkImageToHistogramFilterTest3
  },
  {
    "itkMinimumMaximumImageFilterTest",
    itkMinimumMaximumImageFilterTest
  },
  {
    "itkImagePCAShapeModelEstimatorTest",
    itkImagePCAShapeModelEstimatorTest
  },
  {
    "itkMaximumProjectionImageFilterTest2",
    itkMaximumProjectionImageFilterTest2
  },
  {
    "itkMaximumProjectionImageFilterTest3",
    itkMaximumProjectionImageFilterTest3
  },
  {
    "itkMinimumProjectionImageFilterTest",
    itkMinimumProjectionImageFilterTest
  },
  {
    "itkMeanProjectionImageFilterTest",
    itkMeanProjectionImageFilterTest
  },
  {
    "itkImagePCADecompositionCalculatorTest",
    itkImagePCADecompositionCalculatorTest
  },
  {
    "itkMaximumProjectionImageFilterTest",
    itkMaximumProjectionImageFilterTest
  },
  {
    "itkMedianProjectionImageFilterTest",
    itkMedianProjectionImageFilterTest
  },
  {
    "itkHistogramToEntropyImageFilterTest1",
    itkHistogramToEntropyImageFilterTest1
  },
  {
    "itkHistogramToEntropyImageFilterTest2",
    itkHistogramToEntropyImageFilterTest2
  },
  {
    "itkHistogramToIntensityImageFilterTest1",
    itkHistogramToIntensityImageFilterTest1
  },
  {
    "itkHistogramToIntensityImageFilterTest2",
    itkHistogramToIntensityImageFilterTest2
  },
  {
    "itkHistogramToLogProbabilityImageFilterTest1",
    itkHistogramToLogProbabilityImageFilterTest1
  },
  {
    "itkHistogramToLogProbabilityImageFilterTest2",
    itkHistogramToLogProbabilityImageFilterTest2
  },
  {
    "itkHistogramToProbabilityImageFilterTest1",
    itkHistogramToProbabilityImageFilterTest1
  },
  {
    "itkHistogramToProbabilityImageFilterTest2",
    itkHistogramToProbabilityImageFilterTest2
  },
  {
    "itkAccumulateImageFilterTest",
    itkAccumulateImageFilterTest
  },
  {
    "itkAdaptiveHistogramEqualizationImageFilterTest",
    itkAdaptiveHistogramEqualizationImageFilterTest
  },
  {
    "itkGetAverageSliceImageFilterTest",
    itkGetAverageSliceImageFilterTest
  },
  {
    "itkBinaryProjectionImageFilterTest",
    itkBinaryProjectionImageFilterTest
  },
  {
    "itkProjectionImageFilterTest",
    itkProjectionImageFilterTest
  },
  {
    "itkLabelOverlapMeasuresImageFilterTest",
    itkLabelOverlapMeasuresImageFilterTest
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
