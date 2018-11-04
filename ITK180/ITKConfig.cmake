#-----------------------------------------------------------------------------
#
# ITKConfig.cmake - ITK CMake configuration file for external projects.
#
# This file is configured by ITK and used by the UseITK.cmake module
# to load ITK's settings for an external project.

set(ITK_MODULES_DIR "/Users/antoinerosset/ITK/lib/cmake/ITK-4.1/Modules")

# The C and C++ flags added by ITK to the cmake-configured flags.
set(ITK_REQUIRED_C_FLAGS "")
set(ITK_REQUIRED_CXX_FLAGS " -msse2")
set(ITK_REQUIRED_LINK_FLAGS "")

# The ITK version number
set(ITK_VERSION_MAJOR "4")
set(ITK_VERSION_MINOR "1")
set(ITK_VERSION_PATCH "0")

# If ITK was built with version 3 compatibility features.
set(ITKV3_COMPATIBILITY "OFF")

# The location of the UseITK.cmake file.
set(ITK_USE_FILE "/Users/antoinerosset/ITK/CMake/UseITK.cmake")

# Whether ITK was built with shared libraries.
set(ITK_BUILD_SHARED "OFF")

# List of available ITK modules.
set(ITK_MODULES_ENABLED "ITKKWSys;ITKVNL;ITKVNLInstantiation;ITKCommon;ITKFiniteDifference;ITKImageFilterBase;ITKCurvatureFlow;ITKImageAdaptors;ITKNetlib;ITKStatistics;ITKTransform;ITKImageFunction;ITKImageGrid;ITKAnisotropicSmoothing;ITKImageCompose;ITKIOImageBase;ITKMesh;ITKZLIB;ITKMetaIO;ITKSpatialObjects;ITKImageStatistics;ITKPath;ITKImageIntensity;ITKImageLabel;ITKThresholding;ITKConnectedComponents;ITKMathematicalMorphology;ITKLabelMap;ITKBinaryMathematicalMorphology;ITKNarrowBand;ITKDistanceMap;ITKQuadEdgeMesh;ITKFastMarching;ITKImageCompare;ITKSmoothing;ITKImageGradient;ITKImageSource;ITKImageFeature;ITKOptimizers;ITKSignedDistanceFunction;ITKLevelSets;ITKAntiAlias;ITKPolynomials;ITKBiasCorrection;ITKBioCell;ITKClassifiers;ITKColormap;ITKFFT;ITKConvolution;ITKDICOMParser;ITKDeconvolution;ITKDeformableMesh;ITKDiffusionTensorImage;ITKDisplacementField;ITKEigen;ITKExpat;ITKIOXML;ITKIOSpatialObjects;ITKRegistrationCommon;ITKFEM;ITKPDEDeformableRegistration;ITKFEMRegistration;ITKIOBMP;ITKIOBioRad;ITKOpenJPEG;ITKGDCM;ITKIOGDCM;ITKIOIPL;ITKIOGE;ITKIOGIPL;ITKJPEG;ITKIOJPEG;ITKTIFF;ITKIOTIFF;ITKIOLSM;ITKIOMeta;ITKNIFTI;ITKIONIFTI;ITKNrrdIO;ITKIONRRD;ITKPNG;ITKIOPNG;ITKIORAW;ITKIOSiemens;ITKIOStimulate;ITKIOVTK;ITKKLMRegionGrowing;ITKLabelVoting;ITKMarkovRandomFieldsClassifiers;ITKNeuralNetworks;ITKQuadEdgeMeshFiltering;ITKRegionGrowing;ITKSpatialFunction;ITKTestKernel;ITKVTK;ITKVoronoi;ITKWatersheds;ITKDeprecated;ITKGIFTI;ITKHDF5;ITKIOCSV;ITKIOHDF5;ITKIOMesh;ITKIOTransformBase;ITKIOTransformHDF5;ITKIOTransformInsightLegacy;ITKIOTransformMatlab;ITKImageFusion;ITKIntegratedTest;ITKLevelSetsv4;ITKOptimizersv4;ITKMetricsv4;ITKRegistrationMethodsv4;ITKReview;ITKVideoCore;ITKVideoFiltering;ITKVideoIO")

# Import ITK targets.
set(ITK_CONFIG_TARGETS_FILE "/Users/antoinerosset/ITK/ITKTargets.cmake")
if(NOT ITK_TARGETS_IMPORTED AND NOT ITK_BINARY_DIR)
  set(ITK_TARGETS_IMPORTED 1)
  include("${ITK_CONFIG_TARGETS_FILE}")
endif()

set(ITK_USE_REVIEW "OFF")

# Load module interface macros.
include("/Users/antoinerosset/ITK/CMake/ITKModuleAPI.cmake")

# Compute set of requested modules.
if(ITK_FIND_COMPONENTS)
  # Specific modules requested by find_package(ITK).
  set(ITK_MODULES_REQUESTED "${ITK_FIND_COMPONENTS}")
elseif(NOT "${CMAKE_VERSION}" VERSION_GREATER 2.8.4.20110407)
  # CMake 2.8.4 and lower do not forward the components list through
  # their FindITK.cmake module, so unless the application called
  #
  #   find_package(ITK NO_MODULE ...)
  #
  # then only the per-component variables ITK_FIND_REQUIRED_<mod> will
  # have leaked through.
  set(ITK_MODULES_REQUESTED "")
  get_cmake_property(_vars VARIABLES)
  foreach(v IN LISTS _vars)
    if("x${v}" MATCHES "^xITK_FIND_REQUIRED_" AND ${v})
      string(REGEX REPLACE "^ITK_FIND_REQUIRED_" "" _mod "${v}")
      list(APPEND ITK_MODULES_REQUESTED ${_mod})
    endif()
  endforeach()
endif()
if(NOT ITK_MODULES_REQUESTED)
  # No specific modules requested.  Use all of them.
  set(ITK_MODULES_REQUESTED "${ITK_MODULES_ENABLED}")
endif()

# Load requested modules and their dependencies into variables:
#  ITK_LIBRARIES       = Libraries to link
#  ITK_INCLUDE_DIRS    = Header file search path
#  ITK_LIBRARY_DIRS    = Library search path (for outside dependencies)
itk_module_config(ITK ${ITK_MODULES_REQUESTED})

# Add configuration with FFTW
set(ITK_USE_FFTWD "OFF")
set(ITK_USE_FFTWF "OFF")
set(ITK_USE_SYSTEM_FFTW "OFF")
set(ITK_FFTW_INCLUDE_PATH "")
set(ITK_FFTW_LIBDIR "")
