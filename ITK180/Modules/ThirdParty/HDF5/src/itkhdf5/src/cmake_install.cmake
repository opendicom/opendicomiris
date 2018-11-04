# Install script for directory: /Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src

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

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "headers")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ITK-4.1/itkhdf5" TYPE FILE FILES
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/hdf5.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5api_adpt.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5public.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5version.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5overflow.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5Apkg.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5Apublic.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5ACpkg.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5ACpublic.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5B2pkg.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5B2public.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5Bpkg.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5Bpublic.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5Dpkg.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5Dpublic.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5Edefin.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5Einit.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5Epkg.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5Epubgen.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5Epublic.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5Eterm.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5Fpkg.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5Fpublic.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5FDcore.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5FDdirect.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5FDfamily.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5FDlog.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5FDmpi.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5FDmpio.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5FDmpiposix.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5FDmulti.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5FDpkg.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5FDpublic.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5FDsec2.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5FDstdio.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5FSpkg.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5FSpublic.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5Gpkg.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5Gpublic.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5HFpkg.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5HFpublic.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5HGpkg.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5HGpublic.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5HLpkg.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5HLpublic.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5MPpkg.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5Opkg.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5Opublic.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5Oshared.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5Ppkg.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5Ppublic.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5Spkg.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5Spublic.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5SMpkg.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5Tpkg.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5Tpublic.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5Zpkg.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5Zpublic.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5Cpkg.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5Cpublic.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5Ipkg.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5Ipublic.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5Lpkg.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5Lpublic.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5MMpublic.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5Rpkg.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5Rpublic.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5private.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5Aprivate.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5ACprivate.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5B2private.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5Bprivate.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5CSprivate.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5Dprivate.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5Eprivate.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5FDprivate.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5Fprivate.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5FLprivate.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5FOprivate.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5MFprivate.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5MMprivate.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5Cprivate.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5FSprivate.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5Gprivate.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5HFprivate.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5HGprivate.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5HLprivate.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5HPprivate.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5Iprivate.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5Lprivate.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5MPprivate.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5Oprivate.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5Pprivate.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5RCprivate.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5Rprivate.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5RSprivate.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5SLprivate.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5SMprivate.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5Sprivate.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5STprivate.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5Tprivate.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5TSprivate.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5Vprivate.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5WBprivate.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5Zprivate.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5win32defs.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "headers")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/Users/antoinerosset/ITK/lib/libitkhdf5-4.1.a")
  IF(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libitkhdf5-4.1.a" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libitkhdf5-4.1.a")
    EXECUTE_PROCESS(COMMAND "/usr/bin/ranlib" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libitkhdf5-4.1.a")
  ENDIF()
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

