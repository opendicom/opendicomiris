#include <ctype.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "itkTestDriverIncludeRequiredIOFactories.h"



/* Forward declare test functions. */
int itkAdaptorComparisonTest(int, char*[]);
int itkCellInterfaceTest(int, char*[]);
int itkCovariantVectorGeometryTest(int, char*[]);
int itkDataTypeTest(int, char*[]);
int itkDecoratorTest(int, char*[]);
int itkExtractImage3Dto2DTest(int, char*[]);
int itkExtractImageTest(int, char*[]);
int itkFilterDispatchTest(int, char*[]);
int itkFloodFilledSpatialFunctionTest(int, char*[]);
int itkFloodFillIteratorTest(int, char*[]);
int itkMapContainerTest(int, char*[]);
int itkIteratorTests(int, char*[]);
int itkImageReverseIteratorTest(int, char*[]);
int itkImageComputeOffsetAndIndexTest(int, char*[]);
int itkImageDuplicatorTest(int, char*[]);
int itkImageIteratorsForwardBackwardTest(int, char*[]);
int itkImageLinearIteratorTest(int, char*[]);
int itkImageAdaptorPipeLineTest(int, char*[]);
int itkImportContainerTest(int, char*[]);
int itkImportImageTest(int, char*[]);
int itkImageRandomIteratorTest(int, char*[]);
int itkImageRandomIteratorTest2(int, char*[]);
int itkImageRandomNonRepeatingIteratorWithIndexTest(int, char*[]);
int itkImageRandomNonRepeatingIteratorWithIndexTest2(int, char*[]);
int itkImageSliceIteratorTest(int, char*[]);
int itkTreeContainerTest2(int, char*[]);
int itkTriangleCellTest(int, char*[]);
int itkQuadrilateralCellTest(int, char*[]);
int itkRGBPixelTest(int, char*[]);
int itkLightObjectTest(int, char*[]);
int itkBoundingBoxTest(int, char*[]);
int itkBoundaryConditionTest(int, char*[]);
int itkByteSwapTest(int, char*[]);
int itkSparseImageTest(int, char*[]);
int itkSimpleFilterWatcherTest(int, char*[]);
int itkSymmetricEllipsoidInteriorExteriorSpatialFunctionTest(int, char*[]);
int itkSymmetricSecondRankTensorImageReadTest(int, char*[]);
int itkSymmetricSecondRankTensorImageWriteReadTest(int, char*[]);
int itkArray2DTest(int, char*[]);
int itkFloatingPointExceptionsTest(int, char*[]);
int itkFixedArrayTest2(int, char*[]);
int itkNeighborhoodAlgorithmTest(int, char*[]);
int itkPhasedArray3DSpecialCoordinatesImageTest(int, char*[]);
int itkPriorityQueueTest(int, char*[]);
int itkFileOutputWindowTest(int, char*[]);
int itkSymmetricEigenAnalysisTest(int, char*[]);
int itkSTLThreadTest(int, char*[]);
int itkStreamingImageFilterTest(int, char*[]);
int itkStreamingImageFilterTest2(int, char*[]);
int itkStreamingImageFilterTest3(int, char*[]);
int itkLoggerTest(int, char*[]);
int itkDerivativeOperatorTest(int, char*[]);
int itkColorTableTest(int, char*[]);
int itkNumericTraitsTest(int, char*[]);
int itkImageRegionTest(int, char*[]);
int itkExceptionObjectTest(int, char*[]);
int itkNeighborhoodOperatorTest(int, char*[]);
int itkNewTest(int, char*[]);
int itkNumericsTest(int, char*[]);
int itkAnnulusOperatorTest(int, char*[]);
int itkLineIteratorTest(int, char*[]);
int itkGaussianSpatialFunctionTest(int, char*[]);
int itkRealTimeClockTest(int, char*[]);
int itkRealTimeIntervalTest(int, char*[]);
int itkRealTimeStampTest(int, char*[]);
int itkIntTypesTest(int, char*[]);
int itkBSplineKernelFunctionTest(int, char*[]);
int itkArrayTest(int, char*[]);
int itkImageIteratorTest(int, char*[]);
int itkImageRegionIteratorTest(int, char*[]);
int itkCrossHelperTest(int, char*[]);
int itkImageIteratorWithIndexTest(int, char*[]);
int itkDirectoryTest(int, char*[]);
int itkObjectStoreTest(int, char*[]);
int itkObjectFactoryTest(int, char*[]);
int itkEventObjectTest(int, char*[]);
int itkMathCastWithRangeCheckTest(int, char*[]);
int itkMathRoundProfileTest1(int, char*[]);
int itkMathRoundTest(int, char*[]);
int itkMathRoundTest2(int, char*[]);
int itkModifiedTimeTest(int, char*[]);
int itkMultipleLogOutputTest(int, char*[]);
int itkVectorTest(int, char*[]);
int itkImageTest(int, char*[]);
int itkConditionVariableTest(int, char*[]);
int itkPointSetTest(int, char*[]);
int itkBresenhamLineTest(int, char*[]);
int itkSparseFieldLayerTest(int, char*[]);
int itkDataObjectTest(int, char*[]);
int itkAtanRegularizedHeavisideStepFunctionTest1(int, char*[]);
int itkHashTableTest(int, char*[]);
int itkHeavisideStepFunctionTest1(int, char*[]);
int itkSinRegularizedHeavisideStepFunctionTest1(int, char*[]);
int itkPixelAccessTest(int, char*[]);
int itkPointGeometryTest(int, char*[]);
int itkMersenneTwisterRandomVariateGeneratorTest(int, char*[]);


/* Create map.  */

typedef int (*MainFuncPointer)(int , char*[]);
typedef struct
{
  const char* name;
  MainFuncPointer func;
} functionMapEntry;

functionMapEntry cmakeGeneratedFunctionMapEntries[] = {
    {
    "itkAdaptorComparisonTest",
    itkAdaptorComparisonTest
  },
  {
    "itkCellInterfaceTest",
    itkCellInterfaceTest
  },
  {
    "itkCovariantVectorGeometryTest",
    itkCovariantVectorGeometryTest
  },
  {
    "itkDataTypeTest",
    itkDataTypeTest
  },
  {
    "itkDecoratorTest",
    itkDecoratorTest
  },
  {
    "itkExtractImage3Dto2DTest",
    itkExtractImage3Dto2DTest
  },
  {
    "itkExtractImageTest",
    itkExtractImageTest
  },
  {
    "itkFilterDispatchTest",
    itkFilterDispatchTest
  },
  {
    "itkFloodFilledSpatialFunctionTest",
    itkFloodFilledSpatialFunctionTest
  },
  {
    "itkFloodFillIteratorTest",
    itkFloodFillIteratorTest
  },
  {
    "itkMapContainerTest",
    itkMapContainerTest
  },
  {
    "itkIteratorTests",
    itkIteratorTests
  },
  {
    "itkImageReverseIteratorTest",
    itkImageReverseIteratorTest
  },
  {
    "itkImageComputeOffsetAndIndexTest",
    itkImageComputeOffsetAndIndexTest
  },
  {
    "itkImageDuplicatorTest",
    itkImageDuplicatorTest
  },
  {
    "itkImageIteratorsForwardBackwardTest",
    itkImageIteratorsForwardBackwardTest
  },
  {
    "itkImageLinearIteratorTest",
    itkImageLinearIteratorTest
  },
  {
    "itkImageAdaptorPipeLineTest",
    itkImageAdaptorPipeLineTest
  },
  {
    "itkImportContainerTest",
    itkImportContainerTest
  },
  {
    "itkImportImageTest",
    itkImportImageTest
  },
  {
    "itkImageRandomIteratorTest",
    itkImageRandomIteratorTest
  },
  {
    "itkImageRandomIteratorTest2",
    itkImageRandomIteratorTest2
  },
  {
    "itkImageRandomNonRepeatingIteratorWithIndexTest",
    itkImageRandomNonRepeatingIteratorWithIndexTest
  },
  {
    "itkImageRandomNonRepeatingIteratorWithIndexTest2",
    itkImageRandomNonRepeatingIteratorWithIndexTest2
  },
  {
    "itkImageSliceIteratorTest",
    itkImageSliceIteratorTest
  },
  {
    "itkTreeContainerTest2",
    itkTreeContainerTest2
  },
  {
    "itkTriangleCellTest",
    itkTriangleCellTest
  },
  {
    "itkQuadrilateralCellTest",
    itkQuadrilateralCellTest
  },
  {
    "itkRGBPixelTest",
    itkRGBPixelTest
  },
  {
    "itkLightObjectTest",
    itkLightObjectTest
  },
  {
    "itkBoundingBoxTest",
    itkBoundingBoxTest
  },
  {
    "itkBoundaryConditionTest",
    itkBoundaryConditionTest
  },
  {
    "itkByteSwapTest",
    itkByteSwapTest
  },
  {
    "itkSparseImageTest",
    itkSparseImageTest
  },
  {
    "itkSimpleFilterWatcherTest",
    itkSimpleFilterWatcherTest
  },
  {
    "itkSymmetricEllipsoidInteriorExteriorSpatialFunctionTest",
    itkSymmetricEllipsoidInteriorExteriorSpatialFunctionTest
  },
  {
    "itkSymmetricSecondRankTensorImageReadTest",
    itkSymmetricSecondRankTensorImageReadTest
  },
  {
    "itkSymmetricSecondRankTensorImageWriteReadTest",
    itkSymmetricSecondRankTensorImageWriteReadTest
  },
  {
    "itkArray2DTest",
    itkArray2DTest
  },
  {
    "itkFloatingPointExceptionsTest",
    itkFloatingPointExceptionsTest
  },
  {
    "itkFixedArrayTest2",
    itkFixedArrayTest2
  },
  {
    "itkNeighborhoodAlgorithmTest",
    itkNeighborhoodAlgorithmTest
  },
  {
    "itkPhasedArray3DSpecialCoordinatesImageTest",
    itkPhasedArray3DSpecialCoordinatesImageTest
  },
  {
    "itkPriorityQueueTest",
    itkPriorityQueueTest
  },
  {
    "itkFileOutputWindowTest",
    itkFileOutputWindowTest
  },
  {
    "itkSymmetricEigenAnalysisTest",
    itkSymmetricEigenAnalysisTest
  },
  {
    "itkSTLThreadTest",
    itkSTLThreadTest
  },
  {
    "itkStreamingImageFilterTest",
    itkStreamingImageFilterTest
  },
  {
    "itkStreamingImageFilterTest2",
    itkStreamingImageFilterTest2
  },
  {
    "itkStreamingImageFilterTest3",
    itkStreamingImageFilterTest3
  },
  {
    "itkLoggerTest",
    itkLoggerTest
  },
  {
    "itkDerivativeOperatorTest",
    itkDerivativeOperatorTest
  },
  {
    "itkColorTableTest",
    itkColorTableTest
  },
  {
    "itkNumericTraitsTest",
    itkNumericTraitsTest
  },
  {
    "itkImageRegionTest",
    itkImageRegionTest
  },
  {
    "itkExceptionObjectTest",
    itkExceptionObjectTest
  },
  {
    "itkNeighborhoodOperatorTest",
    itkNeighborhoodOperatorTest
  },
  {
    "itkNewTest",
    itkNewTest
  },
  {
    "itkNumericsTest",
    itkNumericsTest
  },
  {
    "itkAnnulusOperatorTest",
    itkAnnulusOperatorTest
  },
  {
    "itkLineIteratorTest",
    itkLineIteratorTest
  },
  {
    "itkGaussianSpatialFunctionTest",
    itkGaussianSpatialFunctionTest
  },
  {
    "itkRealTimeClockTest",
    itkRealTimeClockTest
  },
  {
    "itkRealTimeIntervalTest",
    itkRealTimeIntervalTest
  },
  {
    "itkRealTimeStampTest",
    itkRealTimeStampTest
  },
  {
    "itkIntTypesTest",
    itkIntTypesTest
  },
  {
    "itkBSplineKernelFunctionTest",
    itkBSplineKernelFunctionTest
  },
  {
    "itkArrayTest",
    itkArrayTest
  },
  {
    "itkImageIteratorTest",
    itkImageIteratorTest
  },
  {
    "itkImageRegionIteratorTest",
    itkImageRegionIteratorTest
  },
  {
    "itkCrossHelperTest",
    itkCrossHelperTest
  },
  {
    "itkImageIteratorWithIndexTest",
    itkImageIteratorWithIndexTest
  },
  {
    "itkDirectoryTest",
    itkDirectoryTest
  },
  {
    "itkObjectStoreTest",
    itkObjectStoreTest
  },
  {
    "itkObjectFactoryTest",
    itkObjectFactoryTest
  },
  {
    "itkEventObjectTest",
    itkEventObjectTest
  },
  {
    "itkMathCastWithRangeCheckTest",
    itkMathCastWithRangeCheckTest
  },
  {
    "itkMathRoundProfileTest1",
    itkMathRoundProfileTest1
  },
  {
    "itkMathRoundTest",
    itkMathRoundTest
  },
  {
    "itkMathRoundTest2",
    itkMathRoundTest2
  },
  {
    "itkModifiedTimeTest",
    itkModifiedTimeTest
  },
  {
    "itkMultipleLogOutputTest",
    itkMultipleLogOutputTest
  },
  {
    "itkVectorTest",
    itkVectorTest
  },
  {
    "itkImageTest",
    itkImageTest
  },
  {
    "itkConditionVariableTest",
    itkConditionVariableTest
  },
  {
    "itkPointSetTest",
    itkPointSetTest
  },
  {
    "itkBresenhamLineTest",
    itkBresenhamLineTest
  },
  {
    "itkSparseFieldLayerTest",
    itkSparseFieldLayerTest
  },
  {
    "itkDataObjectTest",
    itkDataObjectTest
  },
  {
    "itkAtanRegularizedHeavisideStepFunctionTest1",
    itkAtanRegularizedHeavisideStepFunctionTest1
  },
  {
    "itkHashTableTest",
    itkHashTableTest
  },
  {
    "itkHeavisideStepFunctionTest1",
    itkHeavisideStepFunctionTest1
  },
  {
    "itkSinRegularizedHeavisideStepFunctionTest1",
    itkSinRegularizedHeavisideStepFunctionTest1
  },
  {
    "itkPixelAccessTest",
    itkPixelAccessTest
  },
  {
    "itkPointGeometryTest",
    itkPointGeometryTest
  },
  {
    "itkMersenneTwisterRandomVariateGeneratorTest",
    itkMersenneTwisterRandomVariateGeneratorTest
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
