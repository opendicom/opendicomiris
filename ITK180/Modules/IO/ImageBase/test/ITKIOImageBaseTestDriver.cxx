#include <ctype.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "itkTestDriverIncludeRequiredIOFactories.h"



/* Forward declare test functions. */
int itkConvertBufferTest(int, char*[]);
int itkConvertBufferTest2(int, char*[]);
int itkImageFileReaderTest1(int, char*[]);
int itkImageFileWriterTest(int, char*[]);
int itkIOCommonTest(int, char*[]);
int itkIOCommonTest2(int, char*[]);
int itkNumericSeriesFileNamesTest(int, char*[]);
int itkRegularExpressionSeriesFileNamesTest(int, char*[]);
int itkArchetypeSeriesFileNamesTest(int, char*[]);
int itkLargeImageWriteConvertReadTest(int, char*[]);
int itkLargeImageWriteReadTest(int, char*[]);
int itkImageFileReaderDimensionsTest(int, char*[]);
int itkImageFileReaderStreamingTest(int, char*[]);
int itkImageFileReaderStreamingTest2(int, char*[]);
int itkImageFileWriterPastingTest1(int, char*[]);
int itkImageFileWriterPastingTest2(int, char*[]);
int itkImageFileWriterPastingTest3(int, char*[]);
int itkImageFileWriterStreamingPastingCompressingTest1(int, char*[]);
int itkImageFileWriterStreamingTest1(int, char*[]);
int itkImageFileWriterStreamingTest2(int, char*[]);
int itkImageFileWriterTest2(int, char*[]);
int itkImageFileWriterUpdateLargestPossibleRegionTest(int, char*[]);
int itkImageIOBaseTest(int, char*[]);
int itkImageIODirection2DTest(int, char*[]);
int itkImageIODirection3DTest(int, char*[]);
int itkImageIOFileNameExtensionsTests(int, char*[]);
int itkImageSeriesReaderDimensionsTest(int, char*[]);
int itkImageSeriesReaderVectorTest(int, char*[]);
int itkImageSeriesWriterTest(int, char*[]);
int itkIOPluginTest(int, char*[]);
int itkNoiseImageFilterTest(int, char*[]);
int itkMatrixImageWriteReadTest(int, char*[]);
int itkReadWriteImageWithDictionaryTest(int, char*[]);
int itkVectorImageReadWriteTest(int, char*[]);


/* Create map.  */

typedef int (*MainFuncPointer)(int , char*[]);
typedef struct
{
  const char* name;
  MainFuncPointer func;
} functionMapEntry;

functionMapEntry cmakeGeneratedFunctionMapEntries[] = {
    {
    "itkConvertBufferTest",
    itkConvertBufferTest
  },
  {
    "itkConvertBufferTest2",
    itkConvertBufferTest2
  },
  {
    "itkImageFileReaderTest1",
    itkImageFileReaderTest1
  },
  {
    "itkImageFileWriterTest",
    itkImageFileWriterTest
  },
  {
    "itkIOCommonTest",
    itkIOCommonTest
  },
  {
    "itkIOCommonTest2",
    itkIOCommonTest2
  },
  {
    "itkNumericSeriesFileNamesTest",
    itkNumericSeriesFileNamesTest
  },
  {
    "itkRegularExpressionSeriesFileNamesTest",
    itkRegularExpressionSeriesFileNamesTest
  },
  {
    "itkArchetypeSeriesFileNamesTest",
    itkArchetypeSeriesFileNamesTest
  },
  {
    "itkLargeImageWriteConvertReadTest",
    itkLargeImageWriteConvertReadTest
  },
  {
    "itkLargeImageWriteReadTest",
    itkLargeImageWriteReadTest
  },
  {
    "itkImageFileReaderDimensionsTest",
    itkImageFileReaderDimensionsTest
  },
  {
    "itkImageFileReaderStreamingTest",
    itkImageFileReaderStreamingTest
  },
  {
    "itkImageFileReaderStreamingTest2",
    itkImageFileReaderStreamingTest2
  },
  {
    "itkImageFileWriterPastingTest1",
    itkImageFileWriterPastingTest1
  },
  {
    "itkImageFileWriterPastingTest2",
    itkImageFileWriterPastingTest2
  },
  {
    "itkImageFileWriterPastingTest3",
    itkImageFileWriterPastingTest3
  },
  {
    "itkImageFileWriterStreamingPastingCompressingTest1",
    itkImageFileWriterStreamingPastingCompressingTest1
  },
  {
    "itkImageFileWriterStreamingTest1",
    itkImageFileWriterStreamingTest1
  },
  {
    "itkImageFileWriterStreamingTest2",
    itkImageFileWriterStreamingTest2
  },
  {
    "itkImageFileWriterTest2",
    itkImageFileWriterTest2
  },
  {
    "itkImageFileWriterUpdateLargestPossibleRegionTest",
    itkImageFileWriterUpdateLargestPossibleRegionTest
  },
  {
    "itkImageIOBaseTest",
    itkImageIOBaseTest
  },
  {
    "itkImageIODirection2DTest",
    itkImageIODirection2DTest
  },
  {
    "itkImageIODirection3DTest",
    itkImageIODirection3DTest
  },
  {
    "itkImageIOFileNameExtensionsTests",
    itkImageIOFileNameExtensionsTests
  },
  {
    "itkImageSeriesReaderDimensionsTest",
    itkImageSeriesReaderDimensionsTest
  },
  {
    "itkImageSeriesReaderVectorTest",
    itkImageSeriesReaderVectorTest
  },
  {
    "itkImageSeriesWriterTest",
    itkImageSeriesWriterTest
  },
  {
    "itkIOPluginTest",
    itkIOPluginTest
  },
  {
    "itkNoiseImageFilterTest",
    itkNoiseImageFilterTest
  },
  {
    "itkMatrixImageWriteReadTest",
    itkMatrixImageWriteReadTest
  },
  {
    "itkReadWriteImageWithDictionaryTest",
    itkReadWriteImageWithDictionaryTest
  },
  {
    "itkVectorImageReadWriteTest",
    itkVectorImageReadWriteTest
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
