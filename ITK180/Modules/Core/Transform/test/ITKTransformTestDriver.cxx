#include <ctype.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "itkTestDriverIncludeRequiredIOFactories.h"



/* Forward declare test functions. */
int itkFixedCenterOfRotationAffineTransformTest(int, char*[]);
int itkAffineTransformTest(int, char*[]);
int itkLandmarkBasedTransformInitializerTest(int, char*[]);
int itkScaleSkewVersor3DTransformTest(int, char*[]);
int itkEuler3DTransformTest(int, char*[]);
int itkCenteredRigid2DTransformTest(int, char*[]);
int itkEuler2DTransformTest(int, char*[]);
int itkRigid3DTransformTest(int, char*[]);
int itkScaleVersor3DTransformTest(int, char*[]);
int itkTransformTest(int, char*[]);
int itkRigid3DPerspectiveTransformTest(int, char*[]);
int itkSimilarity2DTransformTest(int, char*[]);
int itkTranslationTransformTest(int, char*[]);
int itkIdentityTransformTest(int, char*[]);
int itkv3Rigid3DTransformTest(int, char*[]);
int itkCenteredAffineTransformTest(int, char*[]);
int itkRigid2DTransformTest(int, char*[]);
int itkScaleLogarithmicTransformTest(int, char*[]);
int itkQuaternionRigidTransformTest(int, char*[]);
int itkScaleTransformTest(int, char*[]);
int itkSimilarity3DTransformTest(int, char*[]);
int itkAzimuthElevationToCartesianTransformTest(int, char*[]);
int itkCenteredEuler3DTransformTest(int, char*[]);
int itkTransformsSetParametersTest(int, char*[]);
int itkBSplineDeformableTransformTest(int, char*[]);
int itkBSplineDeformableTransformTest2(int, char*[]);
int itkBSplineDeformableTransformTest3(int, char*[]);
int itkBSplineTransformTest(int, char*[]);
int itkBSplineTransformTest2(int, char*[]);
int itkBSplineTransformTest3(int, char*[]);
int itkBSplineTransformInitializerTest1(int, char*[]);
int itkBSplineTransformInitializerTest2(int, char*[]);
int itkVersorRigid3DTransformTest(int, char*[]);
int itkVersorTransformTest(int, char*[]);
int itkSplineKernelTransformTest(int, char*[]);
int itkCompositeTransformTest(int, char*[]);
int itkTransformCloneTest(int, char*[]);


/* Create map.  */

typedef int (*MainFuncPointer)(int , char*[]);
typedef struct
{
  const char* name;
  MainFuncPointer func;
} functionMapEntry;

functionMapEntry cmakeGeneratedFunctionMapEntries[] = {
    {
    "itkFixedCenterOfRotationAffineTransformTest",
    itkFixedCenterOfRotationAffineTransformTest
  },
  {
    "itkAffineTransformTest",
    itkAffineTransformTest
  },
  {
    "itkLandmarkBasedTransformInitializerTest",
    itkLandmarkBasedTransformInitializerTest
  },
  {
    "itkScaleSkewVersor3DTransformTest",
    itkScaleSkewVersor3DTransformTest
  },
  {
    "itkEuler3DTransformTest",
    itkEuler3DTransformTest
  },
  {
    "itkCenteredRigid2DTransformTest",
    itkCenteredRigid2DTransformTest
  },
  {
    "itkEuler2DTransformTest",
    itkEuler2DTransformTest
  },
  {
    "itkRigid3DTransformTest",
    itkRigid3DTransformTest
  },
  {
    "itkScaleVersor3DTransformTest",
    itkScaleVersor3DTransformTest
  },
  {
    "itkTransformTest",
    itkTransformTest
  },
  {
    "itkRigid3DPerspectiveTransformTest",
    itkRigid3DPerspectiveTransformTest
  },
  {
    "itkSimilarity2DTransformTest",
    itkSimilarity2DTransformTest
  },
  {
    "itkTranslationTransformTest",
    itkTranslationTransformTest
  },
  {
    "itkIdentityTransformTest",
    itkIdentityTransformTest
  },
  {
    "itkv3Rigid3DTransformTest",
    itkv3Rigid3DTransformTest
  },
  {
    "itkCenteredAffineTransformTest",
    itkCenteredAffineTransformTest
  },
  {
    "itkRigid2DTransformTest",
    itkRigid2DTransformTest
  },
  {
    "itkScaleLogarithmicTransformTest",
    itkScaleLogarithmicTransformTest
  },
  {
    "itkQuaternionRigidTransformTest",
    itkQuaternionRigidTransformTest
  },
  {
    "itkScaleTransformTest",
    itkScaleTransformTest
  },
  {
    "itkSimilarity3DTransformTest",
    itkSimilarity3DTransformTest
  },
  {
    "itkAzimuthElevationToCartesianTransformTest",
    itkAzimuthElevationToCartesianTransformTest
  },
  {
    "itkCenteredEuler3DTransformTest",
    itkCenteredEuler3DTransformTest
  },
  {
    "itkTransformsSetParametersTest",
    itkTransformsSetParametersTest
  },
  {
    "itkBSplineDeformableTransformTest",
    itkBSplineDeformableTransformTest
  },
  {
    "itkBSplineDeformableTransformTest2",
    itkBSplineDeformableTransformTest2
  },
  {
    "itkBSplineDeformableTransformTest3",
    itkBSplineDeformableTransformTest3
  },
  {
    "itkBSplineTransformTest",
    itkBSplineTransformTest
  },
  {
    "itkBSplineTransformTest2",
    itkBSplineTransformTest2
  },
  {
    "itkBSplineTransformTest3",
    itkBSplineTransformTest3
  },
  {
    "itkBSplineTransformInitializerTest1",
    itkBSplineTransformInitializerTest1
  },
  {
    "itkBSplineTransformInitializerTest2",
    itkBSplineTransformInitializerTest2
  },
  {
    "itkVersorRigid3DTransformTest",
    itkVersorRigid3DTransformTest
  },
  {
    "itkVersorTransformTest",
    itkVersorTransformTest
  },
  {
    "itkSplineKernelTransformTest",
    itkSplineKernelTransformTest
  },
  {
    "itkCompositeTransformTest",
    itkCompositeTransformTest
  },
  {
    "itkTransformCloneTest",
    itkTransformCloneTest
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
