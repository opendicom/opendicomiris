#include <ctype.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "itkTestDriverIncludeBuiltInIOFactories.h"



/* Forward declare test functions. */
int itkAddConstantToImageFilterTest(int, char*[]);
int itkAreaClosingImageFilterTest(int, char*[]);
int itkAreaOpeningImageFilterTest(int, char*[]);
int itkBoxMeanImageFilterTest(int, char*[]);
int itkBoxSigmaImageFilterTest(int, char*[]);
int itkBruker2DSEQImageIOTest(int, char*[]);
int itkConformalFlatteningMeshFilterTest(int, char*[]);
int itkConformalFlatteningQuadEdgeMeshFilterTest(int, char*[]);
int itkContourExtractor2DImageFilterTest(int, char*[]);
int itkDiffeomorphicDemonsRegistrationFilterTest(int, char*[]);
int itkDiffeomorphicDemonsRegistrationFilterTest2(int, char*[]);
int itkDirectFourierReconstructionImageToImageFilterTest(int, char*[]);
int itkDiscreteGaussianDerivativeImageFilterScaleSpaceTest(int, char*[]);
int itkDiscreteGaussianDerivativeImageFilterTest(int, char*[]);
int itkDiscreteGaussianDerivativeImageFunctionTest(int, char*[]);
int itkDiscreteGradientMagnitudeGaussianImageFunctionTest(int, char*[]);
int itkDiscreteHessianGaussianImageFunctionTest(int, char*[]);
int itkDivideByConstantImageFilterTest(int, char*[]);
int itkExponentialDisplacementFieldImageFilterTest(int, char*[]);
int itkFastApproximateRankImageFilterTest(int, char*[]);
int itkFastSymmetricForcesDemonsRegistrationFilterTest(int, char*[]);
int itkGaussianDerivativeOperatorTest(int, char*[]);
int itkGridForwardWarpImageFilterTest(int, char*[]);
int itkHessianToObjectnessMeasureImageFilterTest(int, char*[]);
int itkImageReadComplexWriteMagnitudeAndPhaseTest(int, char*[]);
int itkImageReadMagnitudeAndPhaseWriteComplexTest(int, char*[]);
int itkImageFunctionTest(int, char*[]);
int itkJPEG2000ImageIOFactoryTest01(int, char*[]);
int itkJPEG2000ImageIORegionOfInterest(int, char*[]);
int itkJPEG2000ImageIOTest00(int, char*[]);
int itkJPEG2000ImageIOTest01(int, char*[]);
int itkJPEG2000ImageIOTest02(int, char*[]);
int itkJPEG2000ImageIOTest03(int, char*[]);
int itkJPEG2000ImageIOTest04(int, char*[]);
int itkJPEG2000ImageIOTest05(int, char*[]);
int itkJPEG2000ImageIOTest06(int, char*[]);
int itkKappaSigmaThresholdImageCalculatorTest(int, char*[]);
int itkKappaSigmaThresholdImageFilterTest(int, char*[]);
int itkLabelGeometryImageFilterTest(int, char*[]);
int itkMapMaskedRankImageFilterTest(int, char*[]);
int itkMapRankImageFilterTest(int, char*[]);
int itkMaskedRankImageFilterTest(int, char*[]);
int itkMorphologicalWatershedFromMarkersImageFilterTest(int, char*[]);
int itkMorphologicalWatershedImageFilterTest(int, char*[]);
int itkMRCImageIOTest(int, char*[]);
int itkMultiphaseDenseFiniteDifferenceImageFilterTest(int, char*[]);
int itkMultiphaseFiniteDifferenceImageFilterTest(int, char*[]);
int itkMultiphaseSparseFiniteDifferenceImageFilterTest(int, char*[]);
int itkMultiplyByConstantImageFilterTest(int, char*[]);
int itkMultiScaleHessianBasedMeasureImageFilterTest(int, char*[]);
int itkNeuralNetworkIOTest(int, char*[]);
int itkOptImageToImageMetricsTest(int, char*[]);
int itkOptImageToImageMetricsTest2(int, char*[]);
int itkOptMattesMutualInformationImageToImageMetricThreadsTest1(int, char*[]);
int itkRankImageFilterTest(int, char*[]);
int itkRegionalMaximaImageFilterTest(int, char*[]);
int itkRegionalMaximaImageFilterTest2(int, char*[]);
int itkRegionalMinimaImageFilterTest(int, char*[]);
int itkRegionalMinimaImageFilterTest2(int, char*[]);
int itkRegionBasedLevelSetFunctionTest(int, char*[]);
int itkRobustAutomaticThresholdImageFilterTest(int, char*[]);
int itkScalarChanAndVeseDenseLevelSetImageFilterTest1(int, char*[]);
int itkScalarChanAndVeseDenseLevelSetImageFilterTest2(int, char*[]);
int itkScalarChanAndVeseDenseLevelSetImageFilterTest3(int, char*[]);
int itkScalarChanAndVeseDenseLevelSetImageFilterTest4(int, char*[]);
int itkScalarChanAndVeseLevelSetFunctionTest1(int, char*[]);
int itkScalarChanAndVeseLevelSetFunctionTest2(int, char*[]);
int itkScalarChanAndVeseSparseLevelSetImageFilterTest1(int, char*[]);
int itkScalarChanAndVeseSparseLevelSetImageFilterTest2(int, char*[]);
int itkScalarRegionBasedLevelSetFunctionTest(int, char*[]);
int itkShapedFloodFilledImageFunctionConditionalConstIteratorTest1(int, char*[]);
int itkShapedFloodFilledImageFunctionConditionalConstIteratorTest2(int, char*[]);
int itkShapedFloodFilledImageFunctionConditionalConstIteratorTest3(int, char*[]);
int itkStochasticFractalDimensionImageFilterTest(int, char*[]);
int itkSubtractConstantFromImageFilterTest(int, char*[]);
int itkTimeAndMemoryProbeTest(int, char*[]);
int itkTransformToDisplacementFieldSourceTest(int, char*[]);
int itkTransformToDisplacementFieldSourceTest1(int, char*[]);
int itkValuedRegionalMaximaImageFilterTest(int, char*[]);
int itkValuedRegionalMinimaImageFilterTest(int, char*[]);
int itkVectorCentralDifferenceImageFunctionTest(int, char*[]);
int itkVoxBoCUBImageIOTest(int, char*[]);
int itkWarpHarmonicEnergyCalculatorTest(int, char*[]);
int itkWarpJacobianDeterminantFilterTest(int, char*[]);


/* Create map.  */

typedef int (*MainFuncPointer)(int , char*[]);
typedef struct
{
  const char* name;
  MainFuncPointer func;
} functionMapEntry;

functionMapEntry cmakeGeneratedFunctionMapEntries[] = {
    {
    "itkAddConstantToImageFilterTest",
    itkAddConstantToImageFilterTest
  },
  {
    "itkAreaClosingImageFilterTest",
    itkAreaClosingImageFilterTest
  },
  {
    "itkAreaOpeningImageFilterTest",
    itkAreaOpeningImageFilterTest
  },
  {
    "itkBoxMeanImageFilterTest",
    itkBoxMeanImageFilterTest
  },
  {
    "itkBoxSigmaImageFilterTest",
    itkBoxSigmaImageFilterTest
  },
  {
    "itkBruker2DSEQImageIOTest",
    itkBruker2DSEQImageIOTest
  },
  {
    "itkConformalFlatteningMeshFilterTest",
    itkConformalFlatteningMeshFilterTest
  },
  {
    "itkConformalFlatteningQuadEdgeMeshFilterTest",
    itkConformalFlatteningQuadEdgeMeshFilterTest
  },
  {
    "itkContourExtractor2DImageFilterTest",
    itkContourExtractor2DImageFilterTest
  },
  {
    "itkDiffeomorphicDemonsRegistrationFilterTest",
    itkDiffeomorphicDemonsRegistrationFilterTest
  },
  {
    "itkDiffeomorphicDemonsRegistrationFilterTest2",
    itkDiffeomorphicDemonsRegistrationFilterTest2
  },
  {
    "itkDirectFourierReconstructionImageToImageFilterTest",
    itkDirectFourierReconstructionImageToImageFilterTest
  },
  {
    "itkDiscreteGaussianDerivativeImageFilterScaleSpaceTest",
    itkDiscreteGaussianDerivativeImageFilterScaleSpaceTest
  },
  {
    "itkDiscreteGaussianDerivativeImageFilterTest",
    itkDiscreteGaussianDerivativeImageFilterTest
  },
  {
    "itkDiscreteGaussianDerivativeImageFunctionTest",
    itkDiscreteGaussianDerivativeImageFunctionTest
  },
  {
    "itkDiscreteGradientMagnitudeGaussianImageFunctionTest",
    itkDiscreteGradientMagnitudeGaussianImageFunctionTest
  },
  {
    "itkDiscreteHessianGaussianImageFunctionTest",
    itkDiscreteHessianGaussianImageFunctionTest
  },
  {
    "itkDivideByConstantImageFilterTest",
    itkDivideByConstantImageFilterTest
  },
  {
    "itkExponentialDisplacementFieldImageFilterTest",
    itkExponentialDisplacementFieldImageFilterTest
  },
  {
    "itkFastApproximateRankImageFilterTest",
    itkFastApproximateRankImageFilterTest
  },
  {
    "itkFastSymmetricForcesDemonsRegistrationFilterTest",
    itkFastSymmetricForcesDemonsRegistrationFilterTest
  },
  {
    "itkGaussianDerivativeOperatorTest",
    itkGaussianDerivativeOperatorTest
  },
  {
    "itkGridForwardWarpImageFilterTest",
    itkGridForwardWarpImageFilterTest
  },
  {
    "itkHessianToObjectnessMeasureImageFilterTest",
    itkHessianToObjectnessMeasureImageFilterTest
  },
  {
    "itkImageReadComplexWriteMagnitudeAndPhaseTest",
    itkImageReadComplexWriteMagnitudeAndPhaseTest
  },
  {
    "itkImageReadMagnitudeAndPhaseWriteComplexTest",
    itkImageReadMagnitudeAndPhaseWriteComplexTest
  },
  {
    "itkImageFunctionTest",
    itkImageFunctionTest
  },
  {
    "itkJPEG2000ImageIOFactoryTest01",
    itkJPEG2000ImageIOFactoryTest01
  },
  {
    "itkJPEG2000ImageIORegionOfInterest",
    itkJPEG2000ImageIORegionOfInterest
  },
  {
    "itkJPEG2000ImageIOTest00",
    itkJPEG2000ImageIOTest00
  },
  {
    "itkJPEG2000ImageIOTest01",
    itkJPEG2000ImageIOTest01
  },
  {
    "itkJPEG2000ImageIOTest02",
    itkJPEG2000ImageIOTest02
  },
  {
    "itkJPEG2000ImageIOTest03",
    itkJPEG2000ImageIOTest03
  },
  {
    "itkJPEG2000ImageIOTest04",
    itkJPEG2000ImageIOTest04
  },
  {
    "itkJPEG2000ImageIOTest05",
    itkJPEG2000ImageIOTest05
  },
  {
    "itkJPEG2000ImageIOTest06",
    itkJPEG2000ImageIOTest06
  },
  {
    "itkKappaSigmaThresholdImageCalculatorTest",
    itkKappaSigmaThresholdImageCalculatorTest
  },
  {
    "itkKappaSigmaThresholdImageFilterTest",
    itkKappaSigmaThresholdImageFilterTest
  },
  {
    "itkLabelGeometryImageFilterTest",
    itkLabelGeometryImageFilterTest
  },
  {
    "itkMapMaskedRankImageFilterTest",
    itkMapMaskedRankImageFilterTest
  },
  {
    "itkMapRankImageFilterTest",
    itkMapRankImageFilterTest
  },
  {
    "itkMaskedRankImageFilterTest",
    itkMaskedRankImageFilterTest
  },
  {
    "itkMorphologicalWatershedFromMarkersImageFilterTest",
    itkMorphologicalWatershedFromMarkersImageFilterTest
  },
  {
    "itkMorphologicalWatershedImageFilterTest",
    itkMorphologicalWatershedImageFilterTest
  },
  {
    "itkMRCImageIOTest",
    itkMRCImageIOTest
  },
  {
    "itkMultiphaseDenseFiniteDifferenceImageFilterTest",
    itkMultiphaseDenseFiniteDifferenceImageFilterTest
  },
  {
    "itkMultiphaseFiniteDifferenceImageFilterTest",
    itkMultiphaseFiniteDifferenceImageFilterTest
  },
  {
    "itkMultiphaseSparseFiniteDifferenceImageFilterTest",
    itkMultiphaseSparseFiniteDifferenceImageFilterTest
  },
  {
    "itkMultiplyByConstantImageFilterTest",
    itkMultiplyByConstantImageFilterTest
  },
  {
    "itkMultiScaleHessianBasedMeasureImageFilterTest",
    itkMultiScaleHessianBasedMeasureImageFilterTest
  },
  {
    "itkNeuralNetworkIOTest",
    itkNeuralNetworkIOTest
  },
  {
    "itkOptImageToImageMetricsTest",
    itkOptImageToImageMetricsTest
  },
  {
    "itkOptImageToImageMetricsTest2",
    itkOptImageToImageMetricsTest2
  },
  {
    "itkOptMattesMutualInformationImageToImageMetricThreadsTest1",
    itkOptMattesMutualInformationImageToImageMetricThreadsTest1
  },
  {
    "itkRankImageFilterTest",
    itkRankImageFilterTest
  },
  {
    "itkRegionalMaximaImageFilterTest",
    itkRegionalMaximaImageFilterTest
  },
  {
    "itkRegionalMaximaImageFilterTest2",
    itkRegionalMaximaImageFilterTest2
  },
  {
    "itkRegionalMinimaImageFilterTest",
    itkRegionalMinimaImageFilterTest
  },
  {
    "itkRegionalMinimaImageFilterTest2",
    itkRegionalMinimaImageFilterTest2
  },
  {
    "itkRegionBasedLevelSetFunctionTest",
    itkRegionBasedLevelSetFunctionTest
  },
  {
    "itkRobustAutomaticThresholdImageFilterTest",
    itkRobustAutomaticThresholdImageFilterTest
  },
  {
    "itkScalarChanAndVeseDenseLevelSetImageFilterTest1",
    itkScalarChanAndVeseDenseLevelSetImageFilterTest1
  },
  {
    "itkScalarChanAndVeseDenseLevelSetImageFilterTest2",
    itkScalarChanAndVeseDenseLevelSetImageFilterTest2
  },
  {
    "itkScalarChanAndVeseDenseLevelSetImageFilterTest3",
    itkScalarChanAndVeseDenseLevelSetImageFilterTest3
  },
  {
    "itkScalarChanAndVeseDenseLevelSetImageFilterTest4",
    itkScalarChanAndVeseDenseLevelSetImageFilterTest4
  },
  {
    "itkScalarChanAndVeseLevelSetFunctionTest1",
    itkScalarChanAndVeseLevelSetFunctionTest1
  },
  {
    "itkScalarChanAndVeseLevelSetFunctionTest2",
    itkScalarChanAndVeseLevelSetFunctionTest2
  },
  {
    "itkScalarChanAndVeseSparseLevelSetImageFilterTest1",
    itkScalarChanAndVeseSparseLevelSetImageFilterTest1
  },
  {
    "itkScalarChanAndVeseSparseLevelSetImageFilterTest2",
    itkScalarChanAndVeseSparseLevelSetImageFilterTest2
  },
  {
    "itkScalarRegionBasedLevelSetFunctionTest",
    itkScalarRegionBasedLevelSetFunctionTest
  },
  {
    "itkShapedFloodFilledImageFunctionConditionalConstIteratorTest1",
    itkShapedFloodFilledImageFunctionConditionalConstIteratorTest1
  },
  {
    "itkShapedFloodFilledImageFunctionConditionalConstIteratorTest2",
    itkShapedFloodFilledImageFunctionConditionalConstIteratorTest2
  },
  {
    "itkShapedFloodFilledImageFunctionConditionalConstIteratorTest3",
    itkShapedFloodFilledImageFunctionConditionalConstIteratorTest3
  },
  {
    "itkStochasticFractalDimensionImageFilterTest",
    itkStochasticFractalDimensionImageFilterTest
  },
  {
    "itkSubtractConstantFromImageFilterTest",
    itkSubtractConstantFromImageFilterTest
  },
  {
    "itkTimeAndMemoryProbeTest",
    itkTimeAndMemoryProbeTest
  },
  {
    "itkTransformToDisplacementFieldSourceTest",
    itkTransformToDisplacementFieldSourceTest
  },
  {
    "itkTransformToDisplacementFieldSourceTest1",
    itkTransformToDisplacementFieldSourceTest1
  },
  {
    "itkValuedRegionalMaximaImageFilterTest",
    itkValuedRegionalMaximaImageFilterTest
  },
  {
    "itkValuedRegionalMinimaImageFilterTest",
    itkValuedRegionalMinimaImageFilterTest
  },
  {
    "itkVectorCentralDifferenceImageFunctionTest",
    itkVectorCentralDifferenceImageFunctionTest
  },
  {
    "itkVoxBoCUBImageIOTest",
    itkVoxBoCUBImageIOTest
  },
  {
    "itkWarpHarmonicEnergyCalculatorTest",
    itkWarpHarmonicEnergyCalculatorTest
  },
  {
    "itkWarpJacobianDeterminantFilterTest",
    itkWarpJacobianDeterminantFilterTest
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

  ProcessArgumentsAndRegisterBuiltInFactories(&ac, &av);

    
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
