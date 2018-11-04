#include <ctype.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "itkTestDriverIncludeRequiredIOFactories.h"



/* Forward declare test functions. */
int itkFEMExceptionTest(int, char*[]);
int itkFEMElement2DMembraneTest(int, char*[]);
int itkFEMElement3DMembraneTest(int, char*[]);
int itkFEMElement2DStrainTest(int, char*[]);
int itkFEMElement2DQuadraticTriangularTest(int, char*[]);
int itkFEMLinearSystemWrapperItpackTest(int, char*[]);
int itkFEMLinearSystemWrapperItpackTest2(int, char*[]);
int itkFEMLinearSystemWrapperVNLTest(int, char*[]);
int itkFEMLinearSystemWrapperDenseVNLTest(int, char*[]);
int itkFEMPArrayTest(int, char*[]);
int itkFEMElement2DC0LinearTriangleStressTest(int, char*[]);
int itkFEMElement2DC0LinearQuadrilateralStrainItpackTest(int, char*[]);
int itkFEMElement2DC0LinearTriangleStrainTest(int, char*[]);
int itkFEMElement2DC0LinearTriangleMembraneTest(int, char*[]);
int itkFEMElement2DC0LinearQuadrilateralStressTest(int, char*[]);
int itkFEMElement2DC0LinearQuadrilateralStrainTest(int, char*[]);
int itkFEMElement2DC0LinearQuadrilateralMembraneTest(int, char*[]);
int itkFEMElement2DC0QuadraticTriangleStrainTest(int, char*[]);
int itkFEMElement2DC0QuadraticTriangleStressTest(int, char*[]);
int itkFEMElement2DC0LinearLineStressTest(int, char*[]);
int itkFEMElement2DC1BeamTest(int, char*[]);
int itkFEMElement3DC0LinearHexahedronStrainTest(int, char*[]);
int itkFEMElement3DC0LinearHexahedronMembraneTest(int, char*[]);
int itkFEMElement3DC0LinearTetrahedronStrainTest(int, char*[]);
int itkFEMElement3DC0LinearTetrahedronMembraneTest(int, char*[]);
int itkFEMLoadBCMFCTest(int, char*[]);
int itkFEMLoadBCMFCTestUser(int, char*[]);
int itkFEMLoadEdgeTest(int, char*[]);
int itkFEMLoadGravConstTest(int, char*[]);
int itkFEMLandmarkLoadImplementationTest(int, char*[]);
int itkFEMSolverTest3D(int, char*[]);
int itkImageToRectilinearFEMObjectFilter2DTest(int, char*[]);
int itkImageToRectilinearFEMObjectFilter3DTest(int, char*[]);
int itkFEMElement2DTest(int, char*[]);
int itkFEMElement3DTest(int, char*[]);
int itkFEMObjectTest(int, char*[]);
int itkFEMObjectTest2(int, char*[]);
int itkFEMSpatialObjectTest(int, char*[]);
int itkFEMSolverHyperbolicTest(int, char*[]);


/* Create map.  */

typedef int (*MainFuncPointer)(int , char*[]);
typedef struct
{
  const char* name;
  MainFuncPointer func;
} functionMapEntry;

functionMapEntry cmakeGeneratedFunctionMapEntries[] = {
    {
    "itkFEMExceptionTest",
    itkFEMExceptionTest
  },
  {
    "itkFEMElement2DMembraneTest",
    itkFEMElement2DMembraneTest
  },
  {
    "itkFEMElement3DMembraneTest",
    itkFEMElement3DMembraneTest
  },
  {
    "itkFEMElement2DStrainTest",
    itkFEMElement2DStrainTest
  },
  {
    "itkFEMElement2DQuadraticTriangularTest",
    itkFEMElement2DQuadraticTriangularTest
  },
  {
    "itkFEMLinearSystemWrapperItpackTest",
    itkFEMLinearSystemWrapperItpackTest
  },
  {
    "itkFEMLinearSystemWrapperItpackTest2",
    itkFEMLinearSystemWrapperItpackTest2
  },
  {
    "itkFEMLinearSystemWrapperVNLTest",
    itkFEMLinearSystemWrapperVNLTest
  },
  {
    "itkFEMLinearSystemWrapperDenseVNLTest",
    itkFEMLinearSystemWrapperDenseVNLTest
  },
  {
    "itkFEMPArrayTest",
    itkFEMPArrayTest
  },
  {
    "itkFEMElement2DC0LinearTriangleStressTest",
    itkFEMElement2DC0LinearTriangleStressTest
  },
  {
    "itkFEMElement2DC0LinearQuadrilateralStrainItpackTest",
    itkFEMElement2DC0LinearQuadrilateralStrainItpackTest
  },
  {
    "itkFEMElement2DC0LinearTriangleStrainTest",
    itkFEMElement2DC0LinearTriangleStrainTest
  },
  {
    "itkFEMElement2DC0LinearTriangleMembraneTest",
    itkFEMElement2DC0LinearTriangleMembraneTest
  },
  {
    "itkFEMElement2DC0LinearQuadrilateralStressTest",
    itkFEMElement2DC0LinearQuadrilateralStressTest
  },
  {
    "itkFEMElement2DC0LinearQuadrilateralStrainTest",
    itkFEMElement2DC0LinearQuadrilateralStrainTest
  },
  {
    "itkFEMElement2DC0LinearQuadrilateralMembraneTest",
    itkFEMElement2DC0LinearQuadrilateralMembraneTest
  },
  {
    "itkFEMElement2DC0QuadraticTriangleStrainTest",
    itkFEMElement2DC0QuadraticTriangleStrainTest
  },
  {
    "itkFEMElement2DC0QuadraticTriangleStressTest",
    itkFEMElement2DC0QuadraticTriangleStressTest
  },
  {
    "itkFEMElement2DC0LinearLineStressTest",
    itkFEMElement2DC0LinearLineStressTest
  },
  {
    "itkFEMElement2DC1BeamTest",
    itkFEMElement2DC1BeamTest
  },
  {
    "itkFEMElement3DC0LinearHexahedronStrainTest",
    itkFEMElement3DC0LinearHexahedronStrainTest
  },
  {
    "itkFEMElement3DC0LinearHexahedronMembraneTest",
    itkFEMElement3DC0LinearHexahedronMembraneTest
  },
  {
    "itkFEMElement3DC0LinearTetrahedronStrainTest",
    itkFEMElement3DC0LinearTetrahedronStrainTest
  },
  {
    "itkFEMElement3DC0LinearTetrahedronMembraneTest",
    itkFEMElement3DC0LinearTetrahedronMembraneTest
  },
  {
    "itkFEMLoadBCMFCTest",
    itkFEMLoadBCMFCTest
  },
  {
    "itkFEMLoadBCMFCTestUser",
    itkFEMLoadBCMFCTestUser
  },
  {
    "itkFEMLoadEdgeTest",
    itkFEMLoadEdgeTest
  },
  {
    "itkFEMLoadGravConstTest",
    itkFEMLoadGravConstTest
  },
  {
    "itkFEMLandmarkLoadImplementationTest",
    itkFEMLandmarkLoadImplementationTest
  },
  {
    "itkFEMSolverTest3D",
    itkFEMSolverTest3D
  },
  {
    "itkImageToRectilinearFEMObjectFilter2DTest",
    itkImageToRectilinearFEMObjectFilter2DTest
  },
  {
    "itkImageToRectilinearFEMObjectFilter3DTest",
    itkImageToRectilinearFEMObjectFilter3DTest
  },
  {
    "itkFEMElement2DTest",
    itkFEMElement2DTest
  },
  {
    "itkFEMElement3DTest",
    itkFEMElement3DTest
  },
  {
    "itkFEMObjectTest",
    itkFEMObjectTest
  },
  {
    "itkFEMObjectTest2",
    itkFEMObjectTest2
  },
  {
    "itkFEMSpatialObjectTest",
    itkFEMSpatialObjectTest
  },
  {
    "itkFEMSolverHyperbolicTest",
    itkFEMSolverHyperbolicTest
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
