# Install script for directory: /Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/Common

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
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/Users/antoinerosset/ITK/lib/libitkgdcmCommon-4.1.a")
  IF(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libitkgdcmCommon-4.1.a" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libitkgdcmCommon-4.1.a")
    EXECUTE_PROCESS(COMMAND "/usr/bin/ranlib" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libitkgdcmCommon-4.1.a")
  ENDIF()
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Development")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Headers")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ITK-4.1" TYPE FILE FILES
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/Common/gdcmASN1.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/Common/gdcmBase64.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/Common/gdcmByteSwap.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/Common/gdcmCommand.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/Common/gdcmConfigure.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/Common/gdcmCryptographicMessageSyntax.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/Common/gdcmDeflateStream.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/Common/gdcmDirectory.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/Common/gdcmDummyValueGenerator.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/Common/gdcmEvent.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/Common/gdcmException.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/Common/gdcmFilename.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/Common/gdcmFilenameGenerator.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/Common/gdcmLegacyMacro.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/Common/gdcmMD5.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/Common/gdcmObject.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/Common/gdcmProgressEvent.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/Common/gdcmSHA1.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/Common/gdcmSmartPointer.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/Common/gdcmStaticAssert.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/Common/gdcmString.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/Common/gdcmSubject.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/Common/gdcmSwapCode.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/Common/gdcmSwapper.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/Common/gdcmSystem.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/Common/gdcmTerminal.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/Common/gdcmTestDriver.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/Common/gdcmTesting.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/Common/gdcmTrace.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/Common/gdcmTypes.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/Common/gdcmUnpacker12Bits.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/Common/gdcmVersion.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/Common/gdcmWin32.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/Common/zipstreamimpl.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/Common/gdcmByteSwap.txx"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/Common/gdcmSwapper.txx"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/Common/gdcmConfigure.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Headers")

