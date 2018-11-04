/*=========================================================================
 *
 *  Copyright Insight Software Consortium
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *         http://www.apache.org/licenses/LICENSE-2.0.txt
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 *
 *=========================================================================*/
#ifndef __itkConfigure_h
#define __itkConfigure_h

/*
 * here is where system computed values get stored these values should only
 * change when the target compile platform changes
 */

/* what byte order */
/* All compilers that support Mac OS X define either __BIG_ENDIAN__ or
   __LITTLE_ENDIAN__ to match the endianness of the architecture being
   compiled for. This is not necessarily the same as the architecture of
   the machine doing the building. In order to support Universal Binaries on
   Mac OS X, we prefer those defines to decide the endianness.
   Elsewhere use the platform check result.  */
#if !defined(__APPLE__)
/* #undef CMAKE_WORDS_BIGENDIAN */
  #ifdef CMAKE_WORDS_BIGENDIAN
    #define ITK_WORDS_BIGENDIAN
  #endif
#elif defined(__BIG_ENDIAN__)
  #define CMAKE_WORDS_BIGENDIAN
  #define ITK_WORDS_BIGENDIAN
#endif

/* what threading system are we using */
#define ITK_USE_PTHREADS
/* #undef ITK_HP_PTHREADS */
/* #undef ITK_USE_WIN32_THREADS */

/* #undef ITK_BUILD_SHARED_LIBS */
#ifdef ITK_BUILD_SHARED_LIBS
#define ITKDLL
#else
#define ITKSTATIC
#endif

#define ITK_CPP_FUNCTION
/* #undef ITKV3_COMPATIBILITY */
/* #undef ITK_LEGACY_REMOVE */
/* #undef ITK_LEGACY_SILENT */
#define ITK_USE_CONCEPT_CHECKING
/* #undef ITK_USE_STRICT_CONCEPT_CHECKING */
/* #undef ITK_EXPLICIT_INSTANTIATION */
/* #undef USE_FFTWF */
/* #undef USE_FFTWD */
/* #undef ITK_USE_REVIEW */
/* #undef ITK_SUPPORTS_TEMPLATED_FRIEND_FUNCTION_WITH_TEMPLATE_ARGUMENTS */
#define ITK_SUPPORTS_TEMPLATED_FRIEND_FUNCTION_WITH_EMPTY_BRACKETS
/* #undef ITK_SUPPORTS_TEMPLATED_FRIEND_FUNCTION_WITH_NULL_STRING */
/* #undef ITK_USE_64BITS_IDS */
#define ITK_COMPILER_SUPPORTS_SSE2_32
#define ITK_COMPILER_SUPPORTS_SSE2_64

/*
 * The  gets replaced with "1" or "", this define is
 * to remap these values to 0 and 1
 */
#define ITK_CMAKEDEFINE_VAR_1 1
#define ITK_CMAKEDEFINE_VAR_ 0

/*
 * Check Include files defines. We use the CMake standard names in the
 * cmake files to reduce extra calls for checking header, but then
 * conditionally defined them here with an ITK_ prefix to prevent
 * collisions and re defined warnings.
 */
#if ITK_CMAKEDEFINE_VAR_1
# define ITK_HAVE_FENV_H
#endif /* HAVE_FENV_H */
#if ITK_CMAKEDEFINE_VAR_1
# define ITK_HAVE_SYS_TYPES_H
#endif  /* HAVE_SYS_TYPES_H */
#if ITK_CMAKEDEFINE_VAR_1
# define ITK_HAVE_STDINT_H
#endif  /* HAVE_STDINT_H */
#if ITK_CMAKEDEFINE_VAR_1
# define ITK_HAVE_STDDEF_H
#endif /* HAVE_STDDEF_H */
#if ITK_CMAKEDEFINE_VAR_1
# define ITK_HAVE_UNISTD_H
#endif /* HAVE_UNISTD_H */
#if ITK_CMAKEDEFINE_VAR_1
# define ITK_HAVE_EMMINTRIN_H
#endif /* HAVE_EMMINTRIN_H */


#undef ITK_CMAKEDEFINE_VAR_1
#undef ITK_CMAKEDEFINE_VAR_


#define ITK_VERSION_MAJOR 4
#define ITK_VERSION_MINOR 1
#define ITK_VERSION_PATCH 0
#define ITK_VERSION_STRING "4.1"

#endif //__itkConfigure_h
