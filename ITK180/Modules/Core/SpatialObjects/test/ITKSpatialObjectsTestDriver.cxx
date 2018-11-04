#include <ctype.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "itkTestDriverIncludeRequiredIOFactories.h"



/* Forward declare test functions. */
int itkSpatialObjectToImageFilterTest(int, char*[]);
int itkLandmarkSpatialObjectTest(int, char*[]);
int itkPolygonGroupSpatialObjectTest(int, char*[]);
int itkImageSpatialObjectTest(int, char*[]);
int itkSpatialObjectToImageStatisticsCalculatorTest(int, char*[]);
int itkImageMaskSpatialObjectTest(int, char*[]);
int itkImageMaskSpatialObjectTest2(int, char*[]);
int itkImageMaskSpatialObjectTest3(int, char*[]);
int itkBlobSpatialObjectTest(int, char*[]);
int itkContourSpatialObjectTest(int, char*[]);
int itkSceneSpatialObjectTest(int, char*[]);
int itkSurfaceSpatialObjectTest(int, char*[]);
int itkMetaArrowConverterTest(int, char*[]);
int itkTubeSpatialObjectTest(int, char*[]);
int itkSpatialObjectToPointSetFilterTest(int, char*[]);
int itkSpatialObjectDuplicatorTest(int, char*[]);
int itkPlaneSpatialObjectTest(int, char*[]);
int itkCylinderSpatialObjectTest(int, char*[]);
int itkSpatialObjectTreeContainerTest(int, char*[]);
int itkAffineGeometryFrameTest(int, char*[]);
int itkBoxSpatialObjectTest(int, char*[]);
int itkGaussianSpatialObjectTest(int, char*[]);
int itkPolygonSpatialObjectTest(int, char*[]);
int itkEllipseSpatialObjectTest(int, char*[]);
int itkMeshSpatialObjectTest(int, char*[]);
int itkArrowSpatialObjectTest(int, char*[]);
int itkLineSpatialObjectTest(int, char*[]);
int itkSpatialObjectTreeContainerIteratorTest(int, char*[]);
int itkNewMetaObjectTypeTest(int, char*[]);


/* Create map.  */

typedef int (*MainFuncPointer)(int , char*[]);
typedef struct
{
  const char* name;
  MainFuncPointer func;
} functionMapEntry;

functionMapEntry cmakeGeneratedFunctionMapEntries[] = {
    {
    "itkSpatialObjectToImageFilterTest",
    itkSpatialObjectToImageFilterTest
  },
  {
    "itkLandmarkSpatialObjectTest",
    itkLandmarkSpatialObjectTest
  },
  {
    "itkPolygonGroupSpatialObjectTest",
    itkPolygonGroupSpatialObjectTest
  },
  {
    "itkImageSpatialObjectTest",
    itkImageSpatialObjectTest
  },
  {
    "itkSpatialObjectToImageStatisticsCalculatorTest",
    itkSpatialObjectToImageStatisticsCalculatorTest
  },
  {
    "itkImageMaskSpatialObjectTest",
    itkImageMaskSpatialObjectTest
  },
  {
    "itkImageMaskSpatialObjectTest2",
    itkImageMaskSpatialObjectTest2
  },
  {
    "itkImageMaskSpatialObjectTest3",
    itkImageMaskSpatialObjectTest3
  },
  {
    "itkBlobSpatialObjectTest",
    itkBlobSpatialObjectTest
  },
  {
    "itkContourSpatialObjectTest",
    itkContourSpatialObjectTest
  },
  {
    "itkSceneSpatialObjectTest",
    itkSceneSpatialObjectTest
  },
  {
    "itkSurfaceSpatialObjectTest",
    itkSurfaceSpatialObjectTest
  },
  {
    "itkMetaArrowConverterTest",
    itkMetaArrowConverterTest
  },
  {
    "itkTubeSpatialObjectTest",
    itkTubeSpatialObjectTest
  },
  {
    "itkSpatialObjectToPointSetFilterTest",
    itkSpatialObjectToPointSetFilterTest
  },
  {
    "itkSpatialObjectDuplicatorTest",
    itkSpatialObjectDuplicatorTest
  },
  {
    "itkPlaneSpatialObjectTest",
    itkPlaneSpatialObjectTest
  },
  {
    "itkCylinderSpatialObjectTest",
    itkCylinderSpatialObjectTest
  },
  {
    "itkSpatialObjectTreeContainerTest",
    itkSpatialObjectTreeContainerTest
  },
  {
    "itkAffineGeometryFrameTest",
    itkAffineGeometryFrameTest
  },
  {
    "itkBoxSpatialObjectTest",
    itkBoxSpatialObjectTest
  },
  {
    "itkGaussianSpatialObjectTest",
    itkGaussianSpatialObjectTest
  },
  {
    "itkPolygonSpatialObjectTest",
    itkPolygonSpatialObjectTest
  },
  {
    "itkEllipseSpatialObjectTest",
    itkEllipseSpatialObjectTest
  },
  {
    "itkMeshSpatialObjectTest",
    itkMeshSpatialObjectTest
  },
  {
    "itkArrowSpatialObjectTest",
    itkArrowSpatialObjectTest
  },
  {
    "itkLineSpatialObjectTest",
    itkLineSpatialObjectTest
  },
  {
    "itkSpatialObjectTreeContainerIteratorTest",
    itkSpatialObjectTreeContainerIteratorTest
  },
  {
    "itkNewMetaObjectTypeTest",
    itkNewMetaObjectTypeTest
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
