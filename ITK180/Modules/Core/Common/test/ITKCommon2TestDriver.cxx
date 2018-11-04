#include <ctype.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "itkTestDriverIncludeRequiredIOFactories.h"



/* Forward declare test functions. */
int itkThreadedIndexedContainerPartitionerTest(int, char*[]);
int itkThreadedIteratorRangePartitionerTest(int, char*[]);
int itkThreadedImageRegionPartitionerTest(int, char*[]);
int itkMetaDataDictionaryTest(int, char*[]);
int itkStdStreamLogOutputTest(int, char*[]);
int itkOctreeTest(int, char*[]);
int itkLoggerThreadWrapperTest(int, char*[]);
int itkThreadLoggerTest(int, char*[]);
int itkThreadDefsTest(int, char*[]);
int itkTimeProbesTest(int, char*[]);
int itkTreeContainerTest(int, char*[]);
int itkVariableLengthVectorTest(int, char*[]);
int itkSpatialFunctionTest(int, char*[]);
int itkPeriodicBoundaryConditionTest(int, char*[]);
int itkSmartPointerTest(int, char*[]);
int itkBarrierTest(int, char*[]);
int itkVariableSizeMatrixTest(int, char*[]);
int itkEllipsoidInteriorExteriorSpatialFunctionTest(int, char*[]);
int itkTimeStampTest(int, char*[]);
int itkConstNeighborhoodIteratorTest(int, char*[]);
int itkShapedNeighborhoodIteratorTest(int, char*[]);
int itkSizeTest(int, char*[]);
int itkMatrixTest(int, char*[]);
int itkAutoPointerTest(int, char*[]);
int itkNeighborhoodIteratorTest(int, char*[]);
int itkLoggerManagerTest(int, char*[]);
int itkBSplineInterpolationWeightFunctionTest(int, char*[]);
int itkSymmetricSecondRankTensorTest(int, char*[]);
int itkConstShapedNeighborhoodIteratorTest(int, char*[]);
int itkConstShapedNeighborhoodIteratorTest2(int, char*[]);
int itkSTLContainerAdaptorTest(int, char*[]);
int itkFiniteCylinderSpatialFunctionTest(int, char*[]);
int itkLoggerOutputTest(int, char*[]);
int itkNeighborhoodTest(int, char*[]);
int itkVersorTest(int, char*[]);
int itkObjectFactoryTest2(int, char*[]);
int itkObjectFactoryTest3(int, char*[]);
int itkMinimumMaximumImageCalculatorTest(int, char*[]);
int itkSliceIteratorTest(int, char*[]);
int itkMultiThreaderTest(int, char*[]);
int itkMultiThreaderEnvTest(int, char*[]);
int itkImageRegionExclusionIteratorWithIndexTest(int, char*[]);
int itkFixedArrayTest(int, char*[]);
int itkImageTransformTest(int, char*[]);
int itkImageFillBufferTest(int, char*[]);
int itkMemoryLeakTest(int, char*[]);
int itkVectorGeometryTest(int, char*[]);
int itkVNLRoundProfileTest1(int, char*[]);
int itkZeroFluxBoundaryConditionTest(int, char*[]);
int itkMemoryProbesCollecterBaseTest(int, char*[]);
int itkImageAlgorithmCopyTest(int, char*[]);
int itkConstantBoundaryConditionTest(int, char*[]);
int itkDataObjectAndProcessObjectTest(int, char*[]);
int itkOptimizerParametersTest(int, char*[]);
int itkImageVectorOptimizerParametersHelperTest(int, char*[]);
int itkCompensatedSummationTest(int, char*[]);
int itkCompensatedSummationTest2(int, char*[]);


/* Create map.  */

typedef int (*MainFuncPointer)(int , char*[]);
typedef struct
{
  const char* name;
  MainFuncPointer func;
} functionMapEntry;

functionMapEntry cmakeGeneratedFunctionMapEntries[] = {
    {
    "itkThreadedIndexedContainerPartitionerTest",
    itkThreadedIndexedContainerPartitionerTest
  },
  {
    "itkThreadedIteratorRangePartitionerTest",
    itkThreadedIteratorRangePartitionerTest
  },
  {
    "itkThreadedImageRegionPartitionerTest",
    itkThreadedImageRegionPartitionerTest
  },
  {
    "itkMetaDataDictionaryTest",
    itkMetaDataDictionaryTest
  },
  {
    "itkStdStreamLogOutputTest",
    itkStdStreamLogOutputTest
  },
  {
    "itkOctreeTest",
    itkOctreeTest
  },
  {
    "itkLoggerThreadWrapperTest",
    itkLoggerThreadWrapperTest
  },
  {
    "itkThreadLoggerTest",
    itkThreadLoggerTest
  },
  {
    "itkThreadDefsTest",
    itkThreadDefsTest
  },
  {
    "itkTimeProbesTest",
    itkTimeProbesTest
  },
  {
    "itkTreeContainerTest",
    itkTreeContainerTest
  },
  {
    "itkVariableLengthVectorTest",
    itkVariableLengthVectorTest
  },
  {
    "itkSpatialFunctionTest",
    itkSpatialFunctionTest
  },
  {
    "itkPeriodicBoundaryConditionTest",
    itkPeriodicBoundaryConditionTest
  },
  {
    "itkSmartPointerTest",
    itkSmartPointerTest
  },
  {
    "itkBarrierTest",
    itkBarrierTest
  },
  {
    "itkVariableSizeMatrixTest",
    itkVariableSizeMatrixTest
  },
  {
    "itkEllipsoidInteriorExteriorSpatialFunctionTest",
    itkEllipsoidInteriorExteriorSpatialFunctionTest
  },
  {
    "itkTimeStampTest",
    itkTimeStampTest
  },
  {
    "itkConstNeighborhoodIteratorTest",
    itkConstNeighborhoodIteratorTest
  },
  {
    "itkShapedNeighborhoodIteratorTest",
    itkShapedNeighborhoodIteratorTest
  },
  {
    "itkSizeTest",
    itkSizeTest
  },
  {
    "itkMatrixTest",
    itkMatrixTest
  },
  {
    "itkAutoPointerTest",
    itkAutoPointerTest
  },
  {
    "itkNeighborhoodIteratorTest",
    itkNeighborhoodIteratorTest
  },
  {
    "itkLoggerManagerTest",
    itkLoggerManagerTest
  },
  {
    "itkBSplineInterpolationWeightFunctionTest",
    itkBSplineInterpolationWeightFunctionTest
  },
  {
    "itkSymmetricSecondRankTensorTest",
    itkSymmetricSecondRankTensorTest
  },
  {
    "itkConstShapedNeighborhoodIteratorTest",
    itkConstShapedNeighborhoodIteratorTest
  },
  {
    "itkConstShapedNeighborhoodIteratorTest2",
    itkConstShapedNeighborhoodIteratorTest2
  },
  {
    "itkSTLContainerAdaptorTest",
    itkSTLContainerAdaptorTest
  },
  {
    "itkFiniteCylinderSpatialFunctionTest",
    itkFiniteCylinderSpatialFunctionTest
  },
  {
    "itkLoggerOutputTest",
    itkLoggerOutputTest
  },
  {
    "itkNeighborhoodTest",
    itkNeighborhoodTest
  },
  {
    "itkVersorTest",
    itkVersorTest
  },
  {
    "itkObjectFactoryTest2",
    itkObjectFactoryTest2
  },
  {
    "itkObjectFactoryTest3",
    itkObjectFactoryTest3
  },
  {
    "itkMinimumMaximumImageCalculatorTest",
    itkMinimumMaximumImageCalculatorTest
  },
  {
    "itkSliceIteratorTest",
    itkSliceIteratorTest
  },
  {
    "itkMultiThreaderTest",
    itkMultiThreaderTest
  },
  {
    "itkMultiThreaderEnvTest",
    itkMultiThreaderEnvTest
  },
  {
    "itkImageRegionExclusionIteratorWithIndexTest",
    itkImageRegionExclusionIteratorWithIndexTest
  },
  {
    "itkFixedArrayTest",
    itkFixedArrayTest
  },
  {
    "itkImageTransformTest",
    itkImageTransformTest
  },
  {
    "itkImageFillBufferTest",
    itkImageFillBufferTest
  },
  {
    "itkMemoryLeakTest",
    itkMemoryLeakTest
  },
  {
    "itkVectorGeometryTest",
    itkVectorGeometryTest
  },
  {
    "itkVNLRoundProfileTest1",
    itkVNLRoundProfileTest1
  },
  {
    "itkZeroFluxBoundaryConditionTest",
    itkZeroFluxBoundaryConditionTest
  },
  {
    "itkMemoryProbesCollecterBaseTest",
    itkMemoryProbesCollecterBaseTest
  },
  {
    "itkImageAlgorithmCopyTest",
    itkImageAlgorithmCopyTest
  },
  {
    "itkConstantBoundaryConditionTest",
    itkConstantBoundaryConditionTest
  },
  {
    "itkDataObjectAndProcessObjectTest",
    itkDataObjectAndProcessObjectTest
  },
  {
    "itkOptimizerParametersTest",
    itkOptimizerParametersTest
  },
  {
    "itkImageVectorOptimizerParametersHelperTest",
    itkImageVectorOptimizerParametersHelperTest
  },
  {
    "itkCompensatedSummationTest",
    itkCompensatedSummationTest
  },
  {
    "itkCompensatedSummationTest2",
    itkCompensatedSummationTest2
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
