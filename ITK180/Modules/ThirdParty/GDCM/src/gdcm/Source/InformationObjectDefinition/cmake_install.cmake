# Install script for directory: /Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/InformationObjectDefinition

# Set the install prefix
IF(NOT DEFINED CMAKE_INSTALL_PREFIX)
  SET(CMAKE_INSTALL_PREFIX "/usr/local")
ENDIF(NOT DEFINED CMAKE_INSTALL_PREFIX)
STRING(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
IF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  IF(BUILD_TYPE)
    STRING(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  ELSE(BUILD_TYPE)
    SET(CMAKE_INSTALL_CONFIG_NAME "Release")
  ENDIF(BUILD_TYPE)
  MESSAGE(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
ENDIF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)

# Set the component getting installed.
IF(NOT CMAKE_INSTALL_COMPONENT)
  IF(COMPONENT)
    MESSAGE(STATUS "Install component: \"${COMPONENT}\"")
    SET(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  ELSE(COMPONENT)
    SET(CMAKE_INSTALL_COMPONENT)
  ENDIF(COMPONENT)
ENDIF(NOT CMAKE_INSTALL_COMPONENT)

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Development")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/Users/antoinerosset/ITK/lib/libitkgdcmIOD-4.1.a")
  IF(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libitkgdcmIOD-4.1.a" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libitkgdcmIOD-4.1.a")
    EXECUTE_PROCESS(COMMAND "/usr/bin/ranlib" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libitkgdcmIOD-4.1.a")
  ENDIF()
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Development")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Headers")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ITK-4.1" TYPE FILE FILES
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/InformationObjectDefinition/gdcmDefinedTerms.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/InformationObjectDefinition/gdcmDefs.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/InformationObjectDefinition/gdcmEnumeratedValues.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/InformationObjectDefinition/gdcmIOD.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/InformationObjectDefinition/gdcmIODEntry.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/InformationObjectDefinition/gdcmIODs.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/InformationObjectDefinition/gdcmMacro.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/InformationObjectDefinition/gdcmMacroEntry.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/InformationObjectDefinition/gdcmMacros.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/InformationObjectDefinition/gdcmModule.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/InformationObjectDefinition/gdcmModuleEntry.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/InformationObjectDefinition/gdcmModules.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/InformationObjectDefinition/gdcmNestedModuleEntries.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/InformationObjectDefinition/gdcmPatient.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/InformationObjectDefinition/gdcmSeries.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/InformationObjectDefinition/gdcmStudy.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/InformationObjectDefinition/gdcmTable.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/InformationObjectDefinition/gdcmTableEntry.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/InformationObjectDefinition/gdcmTableReader.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/InformationObjectDefinition/gdcmTables.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/InformationObjectDefinition/gdcmType.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/InformationObjectDefinition/gdcmUsage.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/InformationObjectDefinition/gdcmXMLDictReader.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/InformationObjectDefinition/gdcmXMLPrivateDictReader.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Headers")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Libraries")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ITK-4.1/gdcm/XML" TYPE FILE FILES
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/InformationObjectDefinition/Part3.xml"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/InformationObjectDefinition/Part4.xml"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Libraries")

