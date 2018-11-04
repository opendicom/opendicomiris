# Install script for directory: /Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataDictionary

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
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/Users/antoinerosset/ITK/lib/libitkgdcmDICT-4.1.a")
  IF(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libitkgdcmDICT-4.1.a" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libitkgdcmDICT-4.1.a")
    EXECUTE_PROCESS(COMMAND "/usr/bin/ranlib" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libitkgdcmDICT-4.1.a")
  ENDIF()
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Development")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Headers")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ITK-4.1" TYPE FILE FILES
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataDictionary/gdcmCSAHeaderDict.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataDictionary/gdcmCSAHeaderDictEntry.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataDictionary/gdcmDict.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataDictionary/gdcmDictConverter.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataDictionary/gdcmDictEntry.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataDictionary/gdcmDicts.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataDictionary/gdcmGlobal.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataDictionary/gdcmGroupDict.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataDictionary/gdcmSOPClassUIDToIOD.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataDictionary/gdcmTagToType.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataDictionary/gdcmUIDs.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Headers")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Libraries")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ITK-4.1/gdcm/XML" TYPE FILE FILES
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataDictionary/CSAHeader.xml"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataDictionary/DICOMV3.xml"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataDictionary/Part6.xml"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataDictionary/Part7.xml"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataDictionary/UIDs.xml"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataDictionary/cp699.xml"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Libraries")

