# Install script for directory: /Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/c++/src

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

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "cppheaders")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ITK-4.1/itkhdf5/cpp" TYPE FILE FILES
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/c++/src/H5AbstractDs.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/c++/src/H5Alltypes.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/c++/src/H5ArrayType.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/c++/src/H5AtomType.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/c++/src/H5Attribute.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/c++/src/H5Classes.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/c++/src/H5CommonFG.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/c++/src/H5CompType.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/c++/src/H5Cpp.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/c++/src/H5CppDoc.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/c++/src/H5DataSet.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/c++/src/H5DataSpace.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/c++/src/H5DataType.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/c++/src/H5DcreatProp.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/c++/src/H5DxferProp.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/c++/src/H5EnumType.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/c++/src/H5Exception.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/c++/src/H5FaccProp.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/c++/src/H5FcreatProp.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/c++/src/H5File.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/c++/src/H5FloatType.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/c++/src/H5Group.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/c++/src/H5IdComponent.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/c++/src/H5Include.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/c++/src/H5IntType.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/c++/src/H5Library.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/c++/src/H5Object.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/c++/src/H5PredType.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/c++/src/H5PropList.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/c++/src/H5StrType.h"
    "/Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/c++/src/H5VarLenType.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "cppheaders")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/Users/antoinerosset/ITK/lib/libitkhdf5_cpp-4.1.a")
  IF(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libitkhdf5_cpp-4.1.a" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libitkhdf5_cpp-4.1.a")
    EXECUTE_PROCESS(COMMAND "/usr/bin/ranlib" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libitkhdf5_cpp-4.1.a")
  ENDIF()
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

