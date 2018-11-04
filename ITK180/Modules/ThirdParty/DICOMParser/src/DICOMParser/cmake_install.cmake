# Install script for directory: /Users/antoinerosset/ITK/Modules/ThirdParty/DICOMParser/src/DICOMParser

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
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/Users/antoinerosset/ITK/lib/libITKDICOMParser-4.1.a")
  IF(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libITKDICOMParser-4.1.a" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libITKDICOMParser-4.1.a")
    EXECUTE_PROCESS(COMMAND "/usr/bin/ranlib" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libITKDICOMParser-4.1.a")
  ENDIF()
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Development")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Development")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ITK-4.1" TYPE FILE FILES
    "/Users/antoinerosset/ITK/Modules/ThirdParty/DICOMParser/src/DICOMParser/DICOMAppHelper.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/DICOMParser/src/DICOMParser/DICOMBuffer.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/DICOMParser/src/DICOMParser/DICOMCallback.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/DICOMParser/src/DICOMParser/DICOMCMakeConfig.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/DICOMParser/src/DICOMParser/DICOMConfig.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/DICOMParser/src/DICOMParser/DICOMFile.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/DICOMParser/src/DICOMParser/DICOMParser.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/DICOMParser/src/DICOMParser/DICOMParserMap.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/DICOMParser/src/DICOMParser/DICOMSource.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/DICOMParser/src/DICOMParser/DICOMTypes.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/DICOMParser/src/DICOMParser/DICOMCMakeConfig.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Development")

