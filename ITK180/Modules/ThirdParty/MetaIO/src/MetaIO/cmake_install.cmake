# Install script for directory: /Users/antoinerosset/ITK/Modules/ThirdParty/MetaIO/src/MetaIO

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
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/Users/antoinerosset/ITK/lib/libITKMetaIO-4.1.a")
  IF(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libITKMetaIO-4.1.a" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libITKMetaIO-4.1.a")
    EXECUTE_PROCESS(COMMAND "/usr/bin/ranlib" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libITKMetaIO-4.1.a")
  ENDIF()
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Development")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Development")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ITK-4.1" TYPE FILE FILES
    "/Users/antoinerosset/ITK/Modules/ThirdParty/MetaIO/src/MetaIO/localMetaConfiguration.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/MetaIO/src/MetaIO/metaArray.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/MetaIO/src/MetaIO/metaArrow.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/MetaIO/src/MetaIO/metaBlob.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/MetaIO/src/MetaIO/metaCommand.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/MetaIO/src/MetaIO/metaContour.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/MetaIO/src/MetaIO/metaDTITube.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/MetaIO/src/MetaIO/metaEllipse.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/MetaIO/src/MetaIO/metaEvent.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/MetaIO/src/MetaIO/metaFEMObject.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/MetaIO/src/MetaIO/metaForm.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/MetaIO/src/MetaIO/metaGaussian.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/MetaIO/src/MetaIO/metaGroup.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/MetaIO/src/MetaIO/metaImage.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/MetaIO/src/MetaIO/metaImageTypes.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/MetaIO/src/MetaIO/metaImageUtils.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/MetaIO/src/MetaIO/metaIOConfig.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/MetaIO/src/MetaIO/metaITKUtils.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/MetaIO/src/MetaIO/metaLandmark.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/MetaIO/src/MetaIO/metaLine.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/MetaIO/src/MetaIO/metaMesh.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/MetaIO/src/MetaIO/metaObject.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/MetaIO/src/MetaIO/metaOutput.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/MetaIO/src/MetaIO/metaScene.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/MetaIO/src/MetaIO/metaSurface.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/MetaIO/src/MetaIO/metaTransform.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/MetaIO/src/MetaIO/metaTube.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/MetaIO/src/MetaIO/metaTubeGraph.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/MetaIO/src/MetaIO/metaTypes.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/MetaIO/src/MetaIO/metaUtils.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/MetaIO/src/MetaIO/metaVesselTube.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/MetaIO/src/MetaIO/metaIOConfig.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Development")

