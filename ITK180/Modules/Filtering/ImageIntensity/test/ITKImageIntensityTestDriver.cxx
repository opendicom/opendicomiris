#include <ctype.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "itkTestDriverIncludeRequiredIOFactories.h"



/* Forward declare test functions. */
int itkCosImageFilterAndAdaptorTest(int, char*[]);
int itkExpImageFilterAndAdaptorTest(int, char*[]);
int itkVectorRescaleIntensityImageFilterTest(int, char*[]);
int itkTernaryMagnitudeSquaredImageFilterTest(int, char*[]);
int itkMinimumImageFilterTest(int, char*[]);
int itkLog10ImageFilterAndAdaptorTest(int, char*[]);
int itkVectorIndexSelectionCastImageFilterTest(int, char*[]);
int itkInvertIntensityImageFilterTest(int, char*[]);
int itkSymmetricEigenAnalysisImageFilterTest(int, char*[]);
int itkEdgePotentialImageFilterTest(int, char*[]);
int itkComplexToModulusFilterAndAdaptorTest(int, char*[]);
int itkAddImageAdaptorTest(int, char*[]);
int itkAndImageFilterTest(int, char*[]);
int itkAdaptImageFilterTest2(int, char*[]);
int itkLogImageFilterAndAdaptorTest(int, char*[]);
int itkNotImageFilterTest(int, char*[]);
int itkImageAdaptorNthElementTest(int, char*[]);
int itkConstrainedValueAdditionImageFilterTest(int, char*[]);
int itkAtanImageFilterAndAdaptorTest(int, char*[]);
int itkMaskNegatedImageFilterTest(int, char*[]);
int itkAddImageFilterTest(int, char*[]);
int itkAddImageFilterFrameTest(int, char*[]);
int itkPowImageFilterTest(int, char*[]);
int itkMultiplyImageFilterTest(int, char*[]);
int itkWeightedAddImageFilterTest(int, char*[]);
int itkRescaleIntensityImageFilterTest(int, char*[]);
int itkNormalizeImageFilterTest(int, char*[]);
int itkNaryAddImageFilterTest(int, char*[]);
int itkShiftScaleImageFilterTest(int, char*[]);
int itkComplexToPhaseFilterAndAdaptorTest(int, char*[]);
int itkIntensityWindowingImageFilterTest(int, char*[]);
int itkTernaryMagnitudeImageFilterTest(int, char*[]);
int itkAbsImageFilterAndAdaptorTest(int, char*[]);
int itkMaximumImageFilterTest(int, char*[]);
int itkBinaryMagnitudeImageFilterTest(int, char*[]);
int itkMatrixIndexSelectionImageFilterTest(int, char*[]);
int itkSquareImageFilterTest(int, char*[]);
int itkRGBToVectorAdaptImageFilterTest(int, char*[]);
int itkComplexToRealFilterAndAdaptorTest(int, char*[]);
int itkNaryMaximumImageFilterTest(int, char*[]);
int itkAtan2ImageFilterTest(int, char*[]);
int itkSqrtImageFilterAndAdaptorTest(int, char*[]);
int itkAsinImageFilterAndAdaptorTest(int, char*[]);
int itkMaskImageFilterTest(int, char*[]);
int itkHistogramMatchingImageFilterTest(int, char*[]);
int itkAcosImageFilterAndAdaptorTest(int, char*[]);
int itkExpNegativeImageFilterAndAdaptorTest(int, char*[]);
int itkTanImageFilterAndAdaptorTest(int, char*[]);
int itkSigmoidImageFilterTest(int, char*[]);
int itkDivideImageFilterTest(int, char*[]);
int itkDivideImageFilterTest2(int, char*[]);
int itkDivideOrZeroOutImageFilterTest(int, char*[]);
int itkVectorExpandImageFilterTest(int, char*[]);
int itkAdaptImageFilterTest(int, char*[]);
int itkOrImageFilterTest(int, char*[]);
int itkRGBToLuminanceImageFilterAndAdaptorTest(int, char*[]);
int itkXorImageFilterTest(int, char*[]);
int itkSubtractImageFilterTest(int, char*[]);
int itkComplexToImaginaryFilterAndAdaptorTest(int, char*[]);
int itkVectorToRGBImageAdaptorTest(int, char*[]);
int itkSinImageFilterAndAdaptorTest(int, char*[]);
int itkPolylineMask2DImageFilterTest(int, char*[]);
int itkPolylineMaskImageFilterTest(int, char*[]);
int itkPromoteDimensionImageTest(int, char*[]);
int itkModulusImageFilterTest(int, char*[]);
int itkVectorMagnitudeImageFilterTest(int, char*[]);
int itkNormalizeToConstantImageFilterTest(int, char*[]);


/* Create map.  */

typedef int (*MainFuncPointer)(int , char*[]);
typedef struct
{
  const char* name;
  MainFuncPointer func;
} functionMapEntry;

functionMapEntry cmakeGeneratedFunctionMapEntries[] = {
    {
    "itkCosImageFilterAndAdaptorTest",
    itkCosImageFilterAndAdaptorTest
  },
  {
    "itkExpImageFilterAndAdaptorTest",
    itkExpImageFilterAndAdaptorTest
  },
  {
    "itkVectorRescaleIntensityImageFilterTest",
    itkVectorRescaleIntensityImageFilterTest
  },
  {
    "itkTernaryMagnitudeSquaredImageFilterTest",
    itkTernaryMagnitudeSquaredImageFilterTest
  },
  {
    "itkMinimumImageFilterTest",
    itkMinimumImageFilterTest
  },
  {
    "itkLog10ImageFilterAndAdaptorTest",
    itkLog10ImageFilterAndAdaptorTest
  },
  {
    "itkVectorIndexSelectionCastImageFilterTest",
    itkVectorIndexSelectionCastImageFilterTest
  },
  {
    "itkInvertIntensityImageFilterTest",
    itkInvertIntensityImageFilterTest
  },
  {
    "itkSymmetricEigenAnalysisImageFilterTest",
    itkSymmetricEigenAnalysisImageFilterTest
  },
  {
    "itkEdgePotentialImageFilterTest",
    itkEdgePotentialImageFilterTest
  },
  {
    "itkComplexToModulusFilterAndAdaptorTest",
    itkComplexToModulusFilterAndAdaptorTest
  },
  {
    "itkAddImageAdaptorTest",
    itkAddImageAdaptorTest
  },
  {
    "itkAndImageFilterTest",
    itkAndImageFilterTest
  },
  {
    "itkAdaptImageFilterTest2",
    itkAdaptImageFilterTest2
  },
  {
    "itkLogImageFilterAndAdaptorTest",
    itkLogImageFilterAndAdaptorTest
  },
  {
    "itkNotImageFilterTest",
    itkNotImageFilterTest
  },
  {
    "itkImageAdaptorNthElementTest",
    itkImageAdaptorNthElementTest
  },
  {
    "itkConstrainedValueAdditionImageFilterTest",
    itkConstrainedValueAdditionImageFilterTest
  },
  {
    "itkAtanImageFilterAndAdaptorTest",
    itkAtanImageFilterAndAdaptorTest
  },
  {
    "itkMaskNegatedImageFilterTest",
    itkMaskNegatedImageFilterTest
  },
  {
    "itkAddImageFilterTest",
    itkAddImageFilterTest
  },
  {
    "itkAddImageFilterFrameTest",
    itkAddImageFilterFrameTest
  },
  {
    "itkPowImageFilterTest",
    itkPowImageFilterTest
  },
  {
    "itkMultiplyImageFilterTest",
    itkMultiplyImageFilterTest
  },
  {
    "itkWeightedAddImageFilterTest",
    itkWeightedAddImageFilterTest
  },
  {
    "itkRescaleIntensityImageFilterTest",
    itkRescaleIntensityImageFilterTest
  },
  {
    "itkNormalizeImageFilterTest",
    itkNormalizeImageFilterTest
  },
  {
    "itkNaryAddImageFilterTest",
    itkNaryAddImageFilterTest
  },
  {
    "itkShiftScaleImageFilterTest",
    itkShiftScaleImageFilterTest
  },
  {
    "itkComplexToPhaseFilterAndAdaptorTest",
    itkComplexToPhaseFilterAndAdaptorTest
  },
  {
    "itkIntensityWindowingImageFilterTest",
    itkIntensityWindowingImageFilterTest
  },
  {
    "itkTernaryMagnitudeImageFilterTest",
    itkTernaryMagnitudeImageFilterTest
  },
  {
    "itkAbsImageFilterAndAdaptorTest",
    itkAbsImageFilterAndAdaptorTest
  },
  {
    "itkMaximumImageFilterTest",
    itkMaximumImageFilterTest
  },
  {
    "itkBinaryMagnitudeImageFilterTest",
    itkBinaryMagnitudeImageFilterTest
  },
  {
    "itkMatrixIndexSelectionImageFilterTest",
    itkMatrixIndexSelectionImageFilterTest
  },
  {
    "itkSquareImageFilterTest",
    itkSquareImageFilterTest
  },
  {
    "itkRGBToVectorAdaptImageFilterTest",
    itkRGBToVectorAdaptImageFilterTest
  },
  {
    "itkComplexToRealFilterAndAdaptorTest",
    itkComplexToRealFilterAndAdaptorTest
  },
  {
    "itkNaryMaximumImageFilterTest",
    itkNaryMaximumImageFilterTest
  },
  {
    "itkAtan2ImageFilterTest",
    itkAtan2ImageFilterTest
  },
  {
    "itkSqrtImageFilterAndAdaptorTest",
    itkSqrtImageFilterAndAdaptorTest
  },
  {
    "itkAsinImageFilterAndAdaptorTest",
    itkAsinImageFilterAndAdaptorTest
  },
  {
    "itkMaskImageFilterTest",
    itkMaskImageFilterTest
  },
  {
    "itkHistogramMatchingImageFilterTest",
    itkHistogramMatchingImageFilterTest
  },
  {
    "itkAcosImageFilterAndAdaptorTest",
    itkAcosImageFilterAndAdaptorTest
  },
  {
    "itkExpNegativeImageFilterAndAdaptorTest",
    itkExpNegativeImageFilterAndAdaptorTest
  },
  {
    "itkTanImageFilterAndAdaptorTest",
    itkTanImageFilterAndAdaptorTest
  },
  {
    "itkSigmoidImageFilterTest",
    itkSigmoidImageFilterTest
  },
  {
    "itkDivideImageFilterTest",
    itkDivideImageFilterTest
  },
  {
    "itkDivideImageFilterTest2",
    itkDivideImageFilterTest2
  },
  {
    "itkDivideOrZeroOutImageFilterTest",
    itkDivideOrZeroOutImageFilterTest
  },
  {
    "itkVectorExpandImageFilterTest",
    itkVectorExpandImageFilterTest
  },
  {
    "itkAdaptImageFilterTest",
    itkAdaptImageFilterTest
  },
  {
    "itkOrImageFilterTest",
    itkOrImageFilterTest
  },
  {
    "itkRGBToLuminanceImageFilterAndAdaptorTest",
    itkRGBToLuminanceImageFilterAndAdaptorTest
  },
  {
    "itkXorImageFilterTest",
    itkXorImageFilterTest
  },
  {
    "itkSubtractImageFilterTest",
    itkSubtractImageFilterTest
  },
  {
    "itkComplexToImaginaryFilterAndAdaptorTest",
    itkComplexToImaginaryFilterAndAdaptorTest
  },
  {
    "itkVectorToRGBImageAdaptorTest",
    itkVectorToRGBImageAdaptorTest
  },
  {
    "itkSinImageFilterAndAdaptorTest",
    itkSinImageFilterAndAdaptorTest
  },
  {
    "itkPolylineMask2DImageFilterTest",
    itkPolylineMask2DImageFilterTest
  },
  {
    "itkPolylineMaskImageFilterTest",
    itkPolylineMaskImageFilterTest
  },
  {
    "itkPromoteDimensionImageTest",
    itkPromoteDimensionImageTest
  },
  {
    "itkModulusImageFilterTest",
    itkModulusImageFilterTest
  },
  {
    "itkVectorMagnitudeImageFilterTest",
    itkVectorMagnitudeImageFilterTest
  },
  {
    "itkNormalizeToConstantImageFilterTest",
    itkNormalizeToConstantImageFilterTest
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
