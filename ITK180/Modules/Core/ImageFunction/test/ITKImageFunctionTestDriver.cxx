#include <ctype.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "itkTestDriverIncludeRequiredIOFactories.h"



/* Forward declare test functions. */
int itkGaussianBlurImageFunctionTest(int, char*[]);
int itkVectorInterpolateImageFunctionTest(int, char*[]);
int itkVarianceImageFunctionTest(int, char*[]);
int itkMedianImageFunctionTest(int, char*[]);
int itkBinaryThresholdImageFunctionTest(int, char*[]);
int itkBSplineDecompositionImageFilterTest(int, char*[]);
int itkBSplineInterpolateImageFunctionTest(int, char*[]);
int itkBSplineResampleImageFunctionTest(int, char*[]);
int itkScatterMatrixImageFunctionTest(int, char*[]);
int itkMeanImageFunctionTest(int, char*[]);
int itkGaussianDerivativeImageFunctionTest(int, char*[]);
int itkCentralDifferenceImageFunctionTest(int, char*[]);
int itkImageAdaptorInterpolateImageFunctionTest(int, char*[]);
int itkCovarianceImageFunctionTest(int, char*[]);
int itkRayCastInterpolateImageFunctionTest(int, char*[]);
int itkNearestNeighborExtrapolateImageFunctionTest(int, char*[]);
int itkVectorMeanImageFunctionTest(int, char*[]);
int itkMahalanobisDistanceThresholdImageFunctionTest(int, char*[]);
int itkInterpolateTest(int, char*[]);
int itkRGBInterpolateImageFunctionTest(int, char*[]);
int itkWindowedSincInterpolateImageFunctionTest(int, char*[]);
int itkLinearInterpolateImageFunctionTest(int, char*[]);
int itkNeighborhoodOperatorImageFunctionTest(int, char*[]);
int itkNearestNeighborInterpolateImageFunctionTest(int, char*[]);
int itkGaussianInterpolateImageFunctionTest(int, char*[]);
int itkLabelImageGaussianInterpolateImageFunctionTest(int, char*[]);
int itkVectorLinearInterpolateNearestNeighborExtrapolateImageFunctionTest(int, char*[]);


/* Create map.  */

typedef int (*MainFuncPointer)(int , char*[]);
typedef struct
{
  const char* name;
  MainFuncPointer func;
} functionMapEntry;

functionMapEntry cmakeGeneratedFunctionMapEntries[] = {
    {
    "itkGaussianBlurImageFunctionTest",
    itkGaussianBlurImageFunctionTest
  },
  {
    "itkVectorInterpolateImageFunctionTest",
    itkVectorInterpolateImageFunctionTest
  },
  {
    "itkVarianceImageFunctionTest",
    itkVarianceImageFunctionTest
  },
  {
    "itkMedianImageFunctionTest",
    itkMedianImageFunctionTest
  },
  {
    "itkBinaryThresholdImageFunctionTest",
    itkBinaryThresholdImageFunctionTest
  },
  {
    "itkBSplineDecompositionImageFilterTest",
    itkBSplineDecompositionImageFilterTest
  },
  {
    "itkBSplineInterpolateImageFunctionTest",
    itkBSplineInterpolateImageFunctionTest
  },
  {
    "itkBSplineResampleImageFunctionTest",
    itkBSplineResampleImageFunctionTest
  },
  {
    "itkScatterMatrixImageFunctionTest",
    itkScatterMatrixImageFunctionTest
  },
  {
    "itkMeanImageFunctionTest",
    itkMeanImageFunctionTest
  },
  {
    "itkGaussianDerivativeImageFunctionTest",
    itkGaussianDerivativeImageFunctionTest
  },
  {
    "itkCentralDifferenceImageFunctionTest",
    itkCentralDifferenceImageFunctionTest
  },
  {
    "itkImageAdaptorInterpolateImageFunctionTest",
    itkImageAdaptorInterpolateImageFunctionTest
  },
  {
    "itkCovarianceImageFunctionTest",
    itkCovarianceImageFunctionTest
  },
  {
    "itkRayCastInterpolateImageFunctionTest",
    itkRayCastInterpolateImageFunctionTest
  },
  {
    "itkNearestNeighborExtrapolateImageFunctionTest",
    itkNearestNeighborExtrapolateImageFunctionTest
  },
  {
    "itkVectorMeanImageFunctionTest",
    itkVectorMeanImageFunctionTest
  },
  {
    "itkMahalanobisDistanceThresholdImageFunctionTest",
    itkMahalanobisDistanceThresholdImageFunctionTest
  },
  {
    "itkInterpolateTest",
    itkInterpolateTest
  },
  {
    "itkRGBInterpolateImageFunctionTest",
    itkRGBInterpolateImageFunctionTest
  },
  {
    "itkWindowedSincInterpolateImageFunctionTest",
    itkWindowedSincInterpolateImageFunctionTest
  },
  {
    "itkLinearInterpolateImageFunctionTest",
    itkLinearInterpolateImageFunctionTest
  },
  {
    "itkNeighborhoodOperatorImageFunctionTest",
    itkNeighborhoodOperatorImageFunctionTest
  },
  {
    "itkNearestNeighborInterpolateImageFunctionTest",
    itkNearestNeighborInterpolateImageFunctionTest
  },
  {
    "itkGaussianInterpolateImageFunctionTest",
    itkGaussianInterpolateImageFunctionTest
  },
  {
    "itkLabelImageGaussianInterpolateImageFunctionTest",
    itkLabelImageGaussianInterpolateImageFunctionTest
  },
  {
    "itkVectorLinearInterpolateNearestNeighborExtrapolateImageFunctionTest",
    itkVectorLinearInterpolateNearestNeighborExtrapolateImageFunctionTest
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
