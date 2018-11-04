#include <ctype.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "itkTestDriverIncludeRequiredIOFactories.h"



/* Forward declare test functions. */
int itkBinaryThresholdImageFilterTest2(int, char*[]);
int itkBinaryThresholdImageFilterTest(int, char*[]);
int itkBinaryThresholdProjectionImageFilterTest(int, char*[]);
int itkBinaryThresholdSpatialFunctionTest(int, char*[]);
int itkHuangThresholdImageFilterTest(int, char*[]);
int itkIntermodesThresholdImageFilterTest(int, char*[]);
int itkIsoDataThresholdImageFilterTest(int, char*[]);
int itkKittlerIllingworthThresholdImageFilterTest(int, char*[]);
int itkLiThresholdImageFilterTest(int, char*[]);
int itkMaximumEntropyThresholdImageFilterTest(int, char*[]);
int itkMomentsThresholdImageFilterTest(int, char*[]);
int itkOtsuMultipleThresholdsCalculatorTest(int, char*[]);
int itkOtsuMultipleThresholdsImageFilterTest(int, char*[]);
int itkOtsuThresholdCalculatorTest(int, char*[]);
int itkOtsuThresholdImageFilterTest(int, char*[]);
int itkRenyiEntropyThresholdImageFilterTest(int, char*[]);
int itkShanbhagThresholdImageFilterTest(int, char*[]);
int itkThresholdImageFilterTest(int, char*[]);
int itkThresholdLabelerImageFilterTest(int, char*[]);
int itkTriangleThresholdImageFilterTest(int, char*[]);
int itkYenThresholdImageFilterTest(int, char*[]);
int itkHuangMaskedThresholdImageFilterTest(int, char*[]);
int itkIntermodesMaskedThresholdImageFilterTest(int, char*[]);
int itkIsoDataMaskedThresholdImageFilterTest(int, char*[]);
int itkKittlerIllingworthMaskedThresholdImageFilterTest(int, char*[]);
int itkLiMaskedThresholdImageFilterTest(int, char*[]);
int itkMaximumEntropyMaskedThresholdImageFilterTest(int, char*[]);
int itkMomentsMaskedThresholdImageFilterTest(int, char*[]);
int itkOtsuMaskedThresholdImageFilterTest(int, char*[]);
int itkRenyiEntropyMaskedThresholdImageFilterTest(int, char*[]);
int itkShanbhagMaskedThresholdImageFilterTest(int, char*[]);
int itkTriangleMaskedThresholdImageFilterTest(int, char*[]);
int itkYenMaskedThresholdImageFilterTest(int, char*[]);


/* Create map.  */

typedef int (*MainFuncPointer)(int , char*[]);
typedef struct
{
  const char* name;
  MainFuncPointer func;
} functionMapEntry;

functionMapEntry cmakeGeneratedFunctionMapEntries[] = {
    {
    "itkBinaryThresholdImageFilterTest2",
    itkBinaryThresholdImageFilterTest2
  },
  {
    "itkBinaryThresholdImageFilterTest",
    itkBinaryThresholdImageFilterTest
  },
  {
    "itkBinaryThresholdProjectionImageFilterTest",
    itkBinaryThresholdProjectionImageFilterTest
  },
  {
    "itkBinaryThresholdSpatialFunctionTest",
    itkBinaryThresholdSpatialFunctionTest
  },
  {
    "itkHuangThresholdImageFilterTest",
    itkHuangThresholdImageFilterTest
  },
  {
    "itkIntermodesThresholdImageFilterTest",
    itkIntermodesThresholdImageFilterTest
  },
  {
    "itkIsoDataThresholdImageFilterTest",
    itkIsoDataThresholdImageFilterTest
  },
  {
    "itkKittlerIllingworthThresholdImageFilterTest",
    itkKittlerIllingworthThresholdImageFilterTest
  },
  {
    "itkLiThresholdImageFilterTest",
    itkLiThresholdImageFilterTest
  },
  {
    "itkMaximumEntropyThresholdImageFilterTest",
    itkMaximumEntropyThresholdImageFilterTest
  },
  {
    "itkMomentsThresholdImageFilterTest",
    itkMomentsThresholdImageFilterTest
  },
  {
    "itkOtsuMultipleThresholdsCalculatorTest",
    itkOtsuMultipleThresholdsCalculatorTest
  },
  {
    "itkOtsuMultipleThresholdsImageFilterTest",
    itkOtsuMultipleThresholdsImageFilterTest
  },
  {
    "itkOtsuThresholdCalculatorTest",
    itkOtsuThresholdCalculatorTest
  },
  {
    "itkOtsuThresholdImageFilterTest",
    itkOtsuThresholdImageFilterTest
  },
  {
    "itkRenyiEntropyThresholdImageFilterTest",
    itkRenyiEntropyThresholdImageFilterTest
  },
  {
    "itkShanbhagThresholdImageFilterTest",
    itkShanbhagThresholdImageFilterTest
  },
  {
    "itkThresholdImageFilterTest",
    itkThresholdImageFilterTest
  },
  {
    "itkThresholdLabelerImageFilterTest",
    itkThresholdLabelerImageFilterTest
  },
  {
    "itkTriangleThresholdImageFilterTest",
    itkTriangleThresholdImageFilterTest
  },
  {
    "itkYenThresholdImageFilterTest",
    itkYenThresholdImageFilterTest
  },
  {
    "itkHuangMaskedThresholdImageFilterTest",
    itkHuangMaskedThresholdImageFilterTest
  },
  {
    "itkIntermodesMaskedThresholdImageFilterTest",
    itkIntermodesMaskedThresholdImageFilterTest
  },
  {
    "itkIsoDataMaskedThresholdImageFilterTest",
    itkIsoDataMaskedThresholdImageFilterTest
  },
  {
    "itkKittlerIllingworthMaskedThresholdImageFilterTest",
    itkKittlerIllingworthMaskedThresholdImageFilterTest
  },
  {
    "itkLiMaskedThresholdImageFilterTest",
    itkLiMaskedThresholdImageFilterTest
  },
  {
    "itkMaximumEntropyMaskedThresholdImageFilterTest",
    itkMaximumEntropyMaskedThresholdImageFilterTest
  },
  {
    "itkMomentsMaskedThresholdImageFilterTest",
    itkMomentsMaskedThresholdImageFilterTest
  },
  {
    "itkOtsuMaskedThresholdImageFilterTest",
    itkOtsuMaskedThresholdImageFilterTest
  },
  {
    "itkRenyiEntropyMaskedThresholdImageFilterTest",
    itkRenyiEntropyMaskedThresholdImageFilterTest
  },
  {
    "itkShanbhagMaskedThresholdImageFilterTest",
    itkShanbhagMaskedThresholdImageFilterTest
  },
  {
    "itkTriangleMaskedThresholdImageFilterTest",
    itkTriangleMaskedThresholdImageFilterTest
  },
  {
    "itkYenMaskedThresholdImageFilterTest",
    itkYenMaskedThresholdImageFilterTest
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
