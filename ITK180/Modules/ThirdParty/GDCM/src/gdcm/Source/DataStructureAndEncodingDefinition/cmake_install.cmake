# Install script for directory: /Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataStructureAndEncodingDefinition

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
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/Users/antoinerosset/ITK/lib/libitkgdcmDSED-4.1.a")
  IF(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libitkgdcmDSED-4.1.a" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libitkgdcmDSED-4.1.a")
    EXECUTE_PROCESS(COMMAND "/usr/bin/ranlib" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libitkgdcmDSED-4.1.a")
  ENDIF()
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Development")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Headers")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ITK-4.1" TYPE FILE FILES
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataStructureAndEncodingDefinition/gdcmAttribute.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataStructureAndEncodingDefinition/gdcmBasicOffsetTable.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataStructureAndEncodingDefinition/gdcmByteBuffer.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataStructureAndEncodingDefinition/gdcmByteSwapFilter.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataStructureAndEncodingDefinition/gdcmByteValue.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataStructureAndEncodingDefinition/gdcmCodeString.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataStructureAndEncodingDefinition/gdcmCP246ExplicitDataElement.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataStructureAndEncodingDefinition/gdcmCSAElement.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataStructureAndEncodingDefinition/gdcmCSAHeader.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataStructureAndEncodingDefinition/gdcmDataElement.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataStructureAndEncodingDefinition/gdcmDataSet.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataStructureAndEncodingDefinition/gdcmElement.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataStructureAndEncodingDefinition/gdcmExplicitDataElement.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataStructureAndEncodingDefinition/gdcmExplicitImplicitDataElement.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataStructureAndEncodingDefinition/gdcmFile.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataStructureAndEncodingDefinition/gdcmFileMetaInformation.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataStructureAndEncodingDefinition/gdcmFileSet.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataStructureAndEncodingDefinition/gdcmFragment.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataStructureAndEncodingDefinition/gdcmImplicitDataElement.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataStructureAndEncodingDefinition/gdcmItem.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataStructureAndEncodingDefinition/gdcmLO.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataStructureAndEncodingDefinition/gdcmMediaStorage.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataStructureAndEncodingDefinition/gdcmParseException.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataStructureAndEncodingDefinition/gdcmParser.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataStructureAndEncodingDefinition/gdcmPDBElement.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataStructureAndEncodingDefinition/gdcmPDBHeader.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataStructureAndEncodingDefinition/gdcmPreamble.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataStructureAndEncodingDefinition/gdcmPrivateTag.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataStructureAndEncodingDefinition/gdcmReader.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataStructureAndEncodingDefinition/gdcmSequenceOfFragments.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataStructureAndEncodingDefinition/gdcmSequenceOfItems.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataStructureAndEncodingDefinition/gdcmTag.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataStructureAndEncodingDefinition/gdcmTransferSyntax.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataStructureAndEncodingDefinition/gdcmUNExplicitDataElement.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataStructureAndEncodingDefinition/gdcmUNExplicitImplicitDataElement.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataStructureAndEncodingDefinition/gdcmValue.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataStructureAndEncodingDefinition/gdcmValueIO.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataStructureAndEncodingDefinition/gdcmVL.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataStructureAndEncodingDefinition/gdcmVM.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataStructureAndEncodingDefinition/gdcmVR.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataStructureAndEncodingDefinition/gdcmVR16ExplicitDataElement.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataStructureAndEncodingDefinition/gdcmWriter.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataStructureAndEncodingDefinition/gdcmCP246ExplicitDataElement.txx"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataStructureAndEncodingDefinition/gdcmCSAHeader.txx"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataStructureAndEncodingDefinition/gdcmDataSet.txx"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataStructureAndEncodingDefinition/gdcmExplicitDataElement.txx"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataStructureAndEncodingDefinition/gdcmExplicitImplicitDataElement.txx"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataStructureAndEncodingDefinition/gdcmFragment.txx"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataStructureAndEncodingDefinition/gdcmImplicitDataElement.txx"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataStructureAndEncodingDefinition/gdcmItem.txx"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataStructureAndEncodingDefinition/gdcmSequenceOfFragments.txx"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataStructureAndEncodingDefinition/gdcmSequenceOfItems.txx"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataStructureAndEncodingDefinition/gdcmUNExplicitDataElement.txx"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataStructureAndEncodingDefinition/gdcmUNExplicitImplicitDataElement.txx"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataStructureAndEncodingDefinition/gdcmValue.txx"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataStructureAndEncodingDefinition/gdcmValueIO.txx"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataStructureAndEncodingDefinition/gdcmVR16ExplicitDataElement.txx"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Headers")

