# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = "/Applications/CMake 2.8-7.app/Contents/bin/cmake"

# The command to remove a file.
RM = "/Applications/CMake 2.8-7.app/Contents/bin/cmake" -E remove -f

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = "/Applications/CMake 2.8-7.app/Contents/bin/ccmake"

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/antoinerosset/ITK

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/antoinerosset/ITK

# Include any dependencies generated for this target.
include Modules/Core/QuadEdgeMesh/src/CMakeFiles/ITKQuadEdgeMesh.dir/depend.make

# Include the progress variables for this target.
include Modules/Core/QuadEdgeMesh/src/CMakeFiles/ITKQuadEdgeMesh.dir/progress.make

# Include the compile flags for this target's objects.
include Modules/Core/QuadEdgeMesh/src/CMakeFiles/ITKQuadEdgeMesh.dir/flags.make

Modules/Core/QuadEdgeMesh/src/CMakeFiles/ITKQuadEdgeMesh.dir/itkQuadEdge.cxx.o: Modules/Core/QuadEdgeMesh/src/CMakeFiles/ITKQuadEdgeMesh.dir/flags.make
Modules/Core/QuadEdgeMesh/src/CMakeFiles/ITKQuadEdgeMesh.dir/itkQuadEdge.cxx.o: Modules/Core/QuadEdgeMesh/src/itkQuadEdge.cxx
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/antoinerosset/ITK/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object Modules/Core/QuadEdgeMesh/src/CMakeFiles/ITKQuadEdgeMesh.dir/itkQuadEdge.cxx.o"
	cd /Users/antoinerosset/ITK/Modules/Core/QuadEdgeMesh/src && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/ITKQuadEdgeMesh.dir/itkQuadEdge.cxx.o -c /Users/antoinerosset/ITK/Modules/Core/QuadEdgeMesh/src/itkQuadEdge.cxx

Modules/Core/QuadEdgeMesh/src/CMakeFiles/ITKQuadEdgeMesh.dir/itkQuadEdge.cxx.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ITKQuadEdgeMesh.dir/itkQuadEdge.cxx.i"
	cd /Users/antoinerosset/ITK/Modules/Core/QuadEdgeMesh/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/antoinerosset/ITK/Modules/Core/QuadEdgeMesh/src/itkQuadEdge.cxx > CMakeFiles/ITKQuadEdgeMesh.dir/itkQuadEdge.cxx.i

Modules/Core/QuadEdgeMesh/src/CMakeFiles/ITKQuadEdgeMesh.dir/itkQuadEdge.cxx.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ITKQuadEdgeMesh.dir/itkQuadEdge.cxx.s"
	cd /Users/antoinerosset/ITK/Modules/Core/QuadEdgeMesh/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/antoinerosset/ITK/Modules/Core/QuadEdgeMesh/src/itkQuadEdge.cxx -o CMakeFiles/ITKQuadEdgeMesh.dir/itkQuadEdge.cxx.s

Modules/Core/QuadEdgeMesh/src/CMakeFiles/ITKQuadEdgeMesh.dir/itkQuadEdge.cxx.o.requires:
.PHONY : Modules/Core/QuadEdgeMesh/src/CMakeFiles/ITKQuadEdgeMesh.dir/itkQuadEdge.cxx.o.requires

Modules/Core/QuadEdgeMesh/src/CMakeFiles/ITKQuadEdgeMesh.dir/itkQuadEdge.cxx.o.provides: Modules/Core/QuadEdgeMesh/src/CMakeFiles/ITKQuadEdgeMesh.dir/itkQuadEdge.cxx.o.requires
	$(MAKE) -f Modules/Core/QuadEdgeMesh/src/CMakeFiles/ITKQuadEdgeMesh.dir/build.make Modules/Core/QuadEdgeMesh/src/CMakeFiles/ITKQuadEdgeMesh.dir/itkQuadEdge.cxx.o.provides.build
.PHONY : Modules/Core/QuadEdgeMesh/src/CMakeFiles/ITKQuadEdgeMesh.dir/itkQuadEdge.cxx.o.provides

Modules/Core/QuadEdgeMesh/src/CMakeFiles/ITKQuadEdgeMesh.dir/itkQuadEdge.cxx.o.provides.build: Modules/Core/QuadEdgeMesh/src/CMakeFiles/ITKQuadEdgeMesh.dir/itkQuadEdge.cxx.o

# Object files for target ITKQuadEdgeMesh
ITKQuadEdgeMesh_OBJECTS = \
"CMakeFiles/ITKQuadEdgeMesh.dir/itkQuadEdge.cxx.o"

# External object files for target ITKQuadEdgeMesh
ITKQuadEdgeMesh_EXTERNAL_OBJECTS =

lib/libITKQuadEdgeMesh-4.1.a: Modules/Core/QuadEdgeMesh/src/CMakeFiles/ITKQuadEdgeMesh.dir/itkQuadEdge.cxx.o
lib/libITKQuadEdgeMesh-4.1.a: Modules/Core/QuadEdgeMesh/src/CMakeFiles/ITKQuadEdgeMesh.dir/build.make
lib/libITKQuadEdgeMesh-4.1.a: Modules/Core/QuadEdgeMesh/src/CMakeFiles/ITKQuadEdgeMesh.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX static library ../../../../lib/libITKQuadEdgeMesh-4.1.a"
	cd /Users/antoinerosset/ITK/Modules/Core/QuadEdgeMesh/src && $(CMAKE_COMMAND) -P CMakeFiles/ITKQuadEdgeMesh.dir/cmake_clean_target.cmake
	cd /Users/antoinerosset/ITK/Modules/Core/QuadEdgeMesh/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ITKQuadEdgeMesh.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
Modules/Core/QuadEdgeMesh/src/CMakeFiles/ITKQuadEdgeMesh.dir/build: lib/libITKQuadEdgeMesh-4.1.a
.PHONY : Modules/Core/QuadEdgeMesh/src/CMakeFiles/ITKQuadEdgeMesh.dir/build

Modules/Core/QuadEdgeMesh/src/CMakeFiles/ITKQuadEdgeMesh.dir/requires: Modules/Core/QuadEdgeMesh/src/CMakeFiles/ITKQuadEdgeMesh.dir/itkQuadEdge.cxx.o.requires
.PHONY : Modules/Core/QuadEdgeMesh/src/CMakeFiles/ITKQuadEdgeMesh.dir/requires

Modules/Core/QuadEdgeMesh/src/CMakeFiles/ITKQuadEdgeMesh.dir/clean:
	cd /Users/antoinerosset/ITK/Modules/Core/QuadEdgeMesh/src && $(CMAKE_COMMAND) -P CMakeFiles/ITKQuadEdgeMesh.dir/cmake_clean.cmake
.PHONY : Modules/Core/QuadEdgeMesh/src/CMakeFiles/ITKQuadEdgeMesh.dir/clean

Modules/Core/QuadEdgeMesh/src/CMakeFiles/ITKQuadEdgeMesh.dir/depend:
	cd /Users/antoinerosset/ITK && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/antoinerosset/ITK /Users/antoinerosset/ITK/Modules/Core/QuadEdgeMesh/src /Users/antoinerosset/ITK /Users/antoinerosset/ITK/Modules/Core/QuadEdgeMesh/src /Users/antoinerosset/ITK/Modules/Core/QuadEdgeMesh/src/CMakeFiles/ITKQuadEdgeMesh.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : Modules/Core/QuadEdgeMesh/src/CMakeFiles/ITKQuadEdgeMesh.dir/depend

