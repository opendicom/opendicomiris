#include <ctype.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "itkTestDriverIncludeRequiredIOFactories.h"



/* Forward declare test functions. */
int itkDecisionRuleTest(int, char*[]);
int itkDenseFrequencyContainer2Test(int, char*[]);
int itkExpectationMaximizationMixtureModelEstimatorTest(int, char*[]);
int itkGaussianDistributionTest(int, char*[]);
int itkGaussianMembershipFunctionTest(int, char*[]);
int itkGaussianMixtureModelComponentTest(int, char*[]);
int itkKalmanLinearEstimatorTest(int, char*[]);
int itkKdTreeBasedKmeansEstimatorTest(int, char*[]);
int itkKdTreeGeneratorTest(int, char*[]);
int itkKdTreeTest1(int, char*[]);
int itkKdTreeTest2(int, char*[]);
int itkKdTreeTest3(int, char*[]);
int itkKdTreeTestSamplePoints(int, char*[]);
int itkMaximumDecisionRuleTest(int, char*[]);
int itkMinimumDecisionRuleTest(int, char*[]);
int itkMaximumRatioDecisionRuleTest(int, char*[]);
int itkMeanSampleFilterTest(int, char*[]);
int itkMeanSampleFilterTest2(int, char*[]);
int itkMeanSampleFilterTest3(int, char*[]);
int itkHistogramTest(int, char*[]);
int itkHistogramToTextureFeaturesFilterTest(int, char*[]);
int itkChiSquareDistributionTest(int, char*[]);
int itkCovarianceSampleFilterTest(int, char*[]);
int itkCovarianceSampleFilterTest2(int, char*[]);
int itkCovarianceSampleFilterTest3(int, char*[]);
int itkWeightedCovarianceSampleFilterTest(int, char*[]);
int itkWeightedCovarianceSampleFilterTest2(int, char*[]);
int itkWeightedMeanSampleFilterTest(int, char*[]);
int itkWeightedCentroidKdTreeGeneratorTest1(int, char*[]);
int itkWeightedCentroidKdTreeGeneratorTest8(int, char*[]);
int itkWeightedCentroidKdTreeGeneratorTest9(int, char*[]);
int itkMahalanobisDistanceMetricTest(int, char*[]);
int itkManhattanDistanceMetricTest(int, char*[]);
int itkMembershipFunctionBaseTest(int, char*[]);
int itkMembershipFunctionBaseTest2(int, char*[]);
int itkMembershipSampleTest1(int, char*[]);
int itkMembershipSampleTest2(int, char*[]);
int itkMembershipSampleTest3(int, char*[]);
int itkMembershipSampleTest4(int, char*[]);
int itkMeasurementVectorTraitsTest(int, char*[]);
int itkNeighborhoodSamplerTest1(int, char*[]);
int itkMixtureModelComponentBaseTest(int, char*[]);
int itkNormalVariateGeneratorTest1(int, char*[]);
int itkDistanceMetricTest(int, char*[]);
int itkDistanceMetricTest2(int, char*[]);
int itkDistanceToCentroidMembershipFunctionTest(int, char*[]);
int itkEuclideanDistanceMetricTest(int, char*[]);
int itkEuclideanSquareDistanceMetricTest(int, char*[]);
int itkListSampleTest(int, char*[]);
int itkImageToListSampleAdaptorTest(int, char*[]);
int itkImageToListSampleAdaptorTest2(int, char*[]);
int itkImageToListSampleFilterTest(int, char*[]);
int itkImageToListSampleFilterTest2(int, char*[]);
int itkImageToListSampleFilterTest3(int, char*[]);
int itkListSampleTest(int, char*[]);
int itkJointDomainImageToListSampleAdaptorTest(int, char*[]);
int itkPointSetToListSampleAdaptorTest(int, char*[]);
int itkProbabilityDistributionTest(int, char*[]);
int itkRandomVariateGeneratorBaseTest(int, char*[]);
int itkSampleTest(int, char*[]);
int itkSampleTest2(int, char*[]);
int itkSampleTest3(int, char*[]);
int itkSampleTest4(int, char*[]);
int itkSampleToHistogramFilterTest(int, char*[]);
int itkSampleToHistogramFilterTest2(int, char*[]);
int itkSampleToHistogramFilterTest3(int, char*[]);
int itkSampleToHistogramFilterTest4(int, char*[]);
int itkSampleToHistogramFilterTest5(int, char*[]);
int itkSampleToHistogramFilterTest6(int, char*[]);
int itkSampleToHistogramFilterTest7(int, char*[]);
int itkSampleToSubsampleFilterTest1(int, char*[]);
int itkScalarImageToCooccurrenceListSampleFilterTest(int, char*[]);
int itkScalarImageToCooccurrenceMatrixFilterTest(int, char*[]);
int itkScalarImageToCooccurrenceMatrixFilterTest2(int, char*[]);
int itkScalarImageToTextureFeaturesFilterTest(int, char*[]);
int itkScalarImageToRunLengthMatrixFilterTest(int, char*[]);
int itkScalarImageToRunLengthFeaturesFilterTest(int, char*[]);
int itkSparseFrequencyContainer2Test(int, char*[]);
int itkStandardDeviationPerComponentSampleFilterTest(int, char*[]);
int itkStatisticsTypesTest(int, char*[]);
int itkSubsampleTest(int, char*[]);
int itkSubsampleTest2(int, char*[]);
int itkSubsampleTest3(int, char*[]);
int itkTDistributionTest(int, char*[]);
int itkStatisticsAlgorithmTest(int, char*[]);
int itkStatisticsAlgorithmTest2(int, char*[]);
int itkVectorContainerToListSampleAdaptorTest(int, char*[]);


/* Create map.  */

typedef int (*MainFuncPointer)(int , char*[]);
typedef struct
{
  const char* name;
  MainFuncPointer func;
} functionMapEntry;

functionMapEntry cmakeGeneratedFunctionMapEntries[] = {
    {
    "itkDecisionRuleTest",
    itkDecisionRuleTest
  },
  {
    "itkDenseFrequencyContainer2Test",
    itkDenseFrequencyContainer2Test
  },
  {
    "itkExpectationMaximizationMixtureModelEstimatorTest",
    itkExpectationMaximizationMixtureModelEstimatorTest
  },
  {
    "itkGaussianDistributionTest",
    itkGaussianDistributionTest
  },
  {
    "itkGaussianMembershipFunctionTest",
    itkGaussianMembershipFunctionTest
  },
  {
    "itkGaussianMixtureModelComponentTest",
    itkGaussianMixtureModelComponentTest
  },
  {
    "itkKalmanLinearEstimatorTest",
    itkKalmanLinearEstimatorTest
  },
  {
    "itkKdTreeBasedKmeansEstimatorTest",
    itkKdTreeBasedKmeansEstimatorTest
  },
  {
    "itkKdTreeGeneratorTest",
    itkKdTreeGeneratorTest
  },
  {
    "itkKdTreeTest1",
    itkKdTreeTest1
  },
  {
    "itkKdTreeTest2",
    itkKdTreeTest2
  },
  {
    "itkKdTreeTest3",
    itkKdTreeTest3
  },
  {
    "itkKdTreeTestSamplePoints",
    itkKdTreeTestSamplePoints
  },
  {
    "itkMaximumDecisionRuleTest",
    itkMaximumDecisionRuleTest
  },
  {
    "itkMinimumDecisionRuleTest",
    itkMinimumDecisionRuleTest
  },
  {
    "itkMaximumRatioDecisionRuleTest",
    itkMaximumRatioDecisionRuleTest
  },
  {
    "itkMeanSampleFilterTest",
    itkMeanSampleFilterTest
  },
  {
    "itkMeanSampleFilterTest2",
    itkMeanSampleFilterTest2
  },
  {
    "itkMeanSampleFilterTest3",
    itkMeanSampleFilterTest3
  },
  {
    "itkHistogramTest",
    itkHistogramTest
  },
  {
    "itkHistogramToTextureFeaturesFilterTest",
    itkHistogramToTextureFeaturesFilterTest
  },
  {
    "itkChiSquareDistributionTest",
    itkChiSquareDistributionTest
  },
  {
    "itkCovarianceSampleFilterTest",
    itkCovarianceSampleFilterTest
  },
  {
    "itkCovarianceSampleFilterTest2",
    itkCovarianceSampleFilterTest2
  },
  {
    "itkCovarianceSampleFilterTest3",
    itkCovarianceSampleFilterTest3
  },
  {
    "itkWeightedCovarianceSampleFilterTest",
    itkWeightedCovarianceSampleFilterTest
  },
  {
    "itkWeightedCovarianceSampleFilterTest2",
    itkWeightedCovarianceSampleFilterTest2
  },
  {
    "itkWeightedMeanSampleFilterTest",
    itkWeightedMeanSampleFilterTest
  },
  {
    "itkWeightedCentroidKdTreeGeneratorTest1",
    itkWeightedCentroidKdTreeGeneratorTest1
  },
  {
    "itkWeightedCentroidKdTreeGeneratorTest8",
    itkWeightedCentroidKdTreeGeneratorTest8
  },
  {
    "itkWeightedCentroidKdTreeGeneratorTest9",
    itkWeightedCentroidKdTreeGeneratorTest9
  },
  {
    "itkMahalanobisDistanceMetricTest",
    itkMahalanobisDistanceMetricTest
  },
  {
    "itkManhattanDistanceMetricTest",
    itkManhattanDistanceMetricTest
  },
  {
    "itkMembershipFunctionBaseTest",
    itkMembershipFunctionBaseTest
  },
  {
    "itkMembershipFunctionBaseTest2",
    itkMembershipFunctionBaseTest2
  },
  {
    "itkMembershipSampleTest1",
    itkMembershipSampleTest1
  },
  {
    "itkMembershipSampleTest2",
    itkMembershipSampleTest2
  },
  {
    "itkMembershipSampleTest3",
    itkMembershipSampleTest3
  },
  {
    "itkMembershipSampleTest4",
    itkMembershipSampleTest4
  },
  {
    "itkMeasurementVectorTraitsTest",
    itkMeasurementVectorTraitsTest
  },
  {
    "itkNeighborhoodSamplerTest1",
    itkNeighborhoodSamplerTest1
  },
  {
    "itkMixtureModelComponentBaseTest",
    itkMixtureModelComponentBaseTest
  },
  {
    "itkNormalVariateGeneratorTest1",
    itkNormalVariateGeneratorTest1
  },
  {
    "itkDistanceMetricTest",
    itkDistanceMetricTest
  },
  {
    "itkDistanceMetricTest2",
    itkDistanceMetricTest2
  },
  {
    "itkDistanceToCentroidMembershipFunctionTest",
    itkDistanceToCentroidMembershipFunctionTest
  },
  {
    "itkEuclideanDistanceMetricTest",
    itkEuclideanDistanceMetricTest
  },
  {
    "itkEuclideanSquareDistanceMetricTest",
    itkEuclideanSquareDistanceMetricTest
  },
  {
    "itkListSampleTest",
    itkListSampleTest
  },
  {
    "itkImageToListSampleAdaptorTest",
    itkImageToListSampleAdaptorTest
  },
  {
    "itkImageToListSampleAdaptorTest2",
    itkImageToListSampleAdaptorTest2
  },
  {
    "itkImageToListSampleFilterTest",
    itkImageToListSampleFilterTest
  },
  {
    "itkImageToListSampleFilterTest2",
    itkImageToListSampleFilterTest2
  },
  {
    "itkImageToListSampleFilterTest3",
    itkImageToListSampleFilterTest3
  },
  {
    "itkListSampleTest",
    itkListSampleTest
  },
  {
    "itkJointDomainImageToListSampleAdaptorTest",
    itkJointDomainImageToListSampleAdaptorTest
  },
  {
    "itkPointSetToListSampleAdaptorTest",
    itkPointSetToListSampleAdaptorTest
  },
  {
    "itkProbabilityDistributionTest",
    itkProbabilityDistributionTest
  },
  {
    "itkRandomVariateGeneratorBaseTest",
    itkRandomVariateGeneratorBaseTest
  },
  {
    "itkSampleTest",
    itkSampleTest
  },
  {
    "itkSampleTest2",
    itkSampleTest2
  },
  {
    "itkSampleTest3",
    itkSampleTest3
  },
  {
    "itkSampleTest4",
    itkSampleTest4
  },
  {
    "itkSampleToHistogramFilterTest",
    itkSampleToHistogramFilterTest
  },
  {
    "itkSampleToHistogramFilterTest2",
    itkSampleToHistogramFilterTest2
  },
  {
    "itkSampleToHistogramFilterTest3",
    itkSampleToHistogramFilterTest3
  },
  {
    "itkSampleToHistogramFilterTest4",
    itkSampleToHistogramFilterTest4
  },
  {
    "itkSampleToHistogramFilterTest5",
    itkSampleToHistogramFilterTest5
  },
  {
    "itkSampleToHistogramFilterTest6",
    itkSampleToHistogramFilterTest6
  },
  {
    "itkSampleToHistogramFilterTest7",
    itkSampleToHistogramFilterTest7
  },
  {
    "itkSampleToSubsampleFilterTest1",
    itkSampleToSubsampleFilterTest1
  },
  {
    "itkScalarImageToCooccurrenceListSampleFilterTest",
    itkScalarImageToCooccurrenceListSampleFilterTest
  },
  {
    "itkScalarImageToCooccurrenceMatrixFilterTest",
    itkScalarImageToCooccurrenceMatrixFilterTest
  },
  {
    "itkScalarImageToCooccurrenceMatrixFilterTest2",
    itkScalarImageToCooccurrenceMatrixFilterTest2
  },
  {
    "itkScalarImageToTextureFeaturesFilterTest",
    itkScalarImageToTextureFeaturesFilterTest
  },
  {
    "itkScalarImageToRunLengthMatrixFilterTest",
    itkScalarImageToRunLengthMatrixFilterTest
  },
  {
    "itkScalarImageToRunLengthFeaturesFilterTest",
    itkScalarImageToRunLengthFeaturesFilterTest
  },
  {
    "itkSparseFrequencyContainer2Test",
    itkSparseFrequencyContainer2Test
  },
  {
    "itkStandardDeviationPerComponentSampleFilterTest",
    itkStandardDeviationPerComponentSampleFilterTest
  },
  {
    "itkStatisticsTypesTest",
    itkStatisticsTypesTest
  },
  {
    "itkSubsampleTest",
    itkSubsampleTest
  },
  {
    "itkSubsampleTest2",
    itkSubsampleTest2
  },
  {
    "itkSubsampleTest3",
    itkSubsampleTest3
  },
  {
    "itkTDistributionTest",
    itkTDistributionTest
  },
  {
    "itkStatisticsAlgorithmTest",
    itkStatisticsAlgorithmTest
  },
  {
    "itkStatisticsAlgorithmTest2",
    itkStatisticsAlgorithmTest2
  },
  {
    "itkVectorContainerToListSampleAdaptorTest",
    itkVectorContainerToListSampleAdaptorTest
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
