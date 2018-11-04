#include <ctype.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "itkTestDriverIncludeRequiredIOFactories.h"



/* Forward declare test functions. */
int itkQuadEdgeMeshPointTest1(int, char*[]);
int itkQuadEdgeMeshTest1(int, char*[]);
int itkQuadEdgeMeshTest2(int, char*[]);
int itkQuadEdgeMeshTest3(int, char*[]);
int itkQuadEdgeMeshPolygonCellTest(int, char*[]);
int itkQuadEdgeMeshFrontIteratorTest(int, char*[]);
int itkQuadEdgeMeshScalarDataVTKPolyDataWriterTest1(int, char*[]);
int itkQuadEdgeTest1(int, char*[]);
int itkGeometricalQuadEdgeTest1(int, char*[]);
int itkQuadEdgeMeshAddFaceTest1(int, char*[]);
int itkQuadEdgeMeshAddFaceTest2(int, char*[]);
int itkQuadEdgeMeshBasicLayerTest(int, char*[]);
int itkQuadEdgeMeshCellInterfaceTest(int, char*[]);
int itkQuadEdgeMeshCountingCellsTest(int, char*[]);
int itkQuadEdgeMeshDeleteEdgeTest(int, char*[]);
int itkQuadEdgeMeshDeletePointAndReorderIDsTest(int, char*[]);
int itkQuadEdgeMeshEulerOperatorCreateCenterVertexTest(int, char*[]);
int itkQuadEdgeMeshEulerOperatorDeleteCenterVertexTest(int, char*[]);
int itkQuadEdgeMeshEulerOperatorFlipTest(int, char*[]);
int itkQuadEdgeMeshEulerOperatorJoinFacetTest(int, char*[]);
int itkQuadEdgeMeshEulerOperatorJoinVertexTest(int, char*[]);
int itkQuadEdgeMeshEulerOperatorSplitEdgeTest(int, char*[]);
int itkQuadEdgeMeshEulerOperatorSplitFaceTest(int, char*[]);
int itkQuadEdgeMeshEulerOperatorSplitVertexTest(int, char*[]);
int itkQuadEdgeMeshIteratorTest(int, char*[]);
int itkQuadEdgeMeshNoPointConstTest(int, char*[]);
int itkVTKPolyDataIOQuadEdgeMeshTest(int, char*[]);
int itkVTKPolyDataReaderQuadEdgeMeshTest(int, char*[]);
int itkDynamicQuadEdgeMeshTest(int, char*[]);


/* Create map.  */

typedef int (*MainFuncPointer)(int , char*[]);
typedef struct
{
  const char* name;
  MainFuncPointer func;
} functionMapEntry;

functionMapEntry cmakeGeneratedFunctionMapEntries[] = {
    {
    "itkQuadEdgeMeshPointTest1",
    itkQuadEdgeMeshPointTest1
  },
  {
    "itkQuadEdgeMeshTest1",
    itkQuadEdgeMeshTest1
  },
  {
    "itkQuadEdgeMeshTest2",
    itkQuadEdgeMeshTest2
  },
  {
    "itkQuadEdgeMeshTest3",
    itkQuadEdgeMeshTest3
  },
  {
    "itkQuadEdgeMeshPolygonCellTest",
    itkQuadEdgeMeshPolygonCellTest
  },
  {
    "itkQuadEdgeMeshFrontIteratorTest",
    itkQuadEdgeMeshFrontIteratorTest
  },
  {
    "itkQuadEdgeMeshScalarDataVTKPolyDataWriterTest1",
    itkQuadEdgeMeshScalarDataVTKPolyDataWriterTest1
  },
  {
    "itkQuadEdgeTest1",
    itkQuadEdgeTest1
  },
  {
    "itkGeometricalQuadEdgeTest1",
    itkGeometricalQuadEdgeTest1
  },
  {
    "itkQuadEdgeMeshAddFaceTest1",
    itkQuadEdgeMeshAddFaceTest1
  },
  {
    "itkQuadEdgeMeshAddFaceTest2",
    itkQuadEdgeMeshAddFaceTest2
  },
  {
    "itkQuadEdgeMeshBasicLayerTest",
    itkQuadEdgeMeshBasicLayerTest
  },
  {
    "itkQuadEdgeMeshCellInterfaceTest",
    itkQuadEdgeMeshCellInterfaceTest
  },
  {
    "itkQuadEdgeMeshCountingCellsTest",
    itkQuadEdgeMeshCountingCellsTest
  },
  {
    "itkQuadEdgeMeshDeleteEdgeTest",
    itkQuadEdgeMeshDeleteEdgeTest
  },
  {
    "itkQuadEdgeMeshDeletePointAndReorderIDsTest",
    itkQuadEdgeMeshDeletePointAndReorderIDsTest
  },
  {
    "itkQuadEdgeMeshEulerOperatorCreateCenterVertexTest",
    itkQuadEdgeMeshEulerOperatorCreateCenterVertexTest
  },
  {
    "itkQuadEdgeMeshEulerOperatorDeleteCenterVertexTest",
    itkQuadEdgeMeshEulerOperatorDeleteCenterVertexTest
  },
  {
    "itkQuadEdgeMeshEulerOperatorFlipTest",
    itkQuadEdgeMeshEulerOperatorFlipTest
  },
  {
    "itkQuadEdgeMeshEulerOperatorJoinFacetTest",
    itkQuadEdgeMeshEulerOperatorJoinFacetTest
  },
  {
    "itkQuadEdgeMeshEulerOperatorJoinVertexTest",
    itkQuadEdgeMeshEulerOperatorJoinVertexTest
  },
  {
    "itkQuadEdgeMeshEulerOperatorSplitEdgeTest",
    itkQuadEdgeMeshEulerOperatorSplitEdgeTest
  },
  {
    "itkQuadEdgeMeshEulerOperatorSplitFaceTest",
    itkQuadEdgeMeshEulerOperatorSplitFaceTest
  },
  {
    "itkQuadEdgeMeshEulerOperatorSplitVertexTest",
    itkQuadEdgeMeshEulerOperatorSplitVertexTest
  },
  {
    "itkQuadEdgeMeshIteratorTest",
    itkQuadEdgeMeshIteratorTest
  },
  {
    "itkQuadEdgeMeshNoPointConstTest",
    itkQuadEdgeMeshNoPointConstTest
  },
  {
    "itkVTKPolyDataIOQuadEdgeMeshTest",
    itkVTKPolyDataIOQuadEdgeMeshTest
  },
  {
    "itkVTKPolyDataReaderQuadEdgeMeshTest",
    itkVTKPolyDataReaderQuadEdgeMeshTest
  },
  {
    "itkDynamicQuadEdgeMeshTest",
    itkDynamicQuadEdgeMeshTest
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
