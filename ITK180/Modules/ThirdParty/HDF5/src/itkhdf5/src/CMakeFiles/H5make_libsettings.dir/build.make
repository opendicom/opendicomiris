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
include Modules/ThirdParty/HDF5/src/itkhdf5/src/CMakeFiles/H5make_libsettings.dir/depend.make

# Include the progress variables for this target.
include Modules/ThirdParty/HDF5/src/itkhdf5/src/CMakeFiles/H5make_libsettings.dir/progress.make

# Include the compile flags for this target's objects.
include Modules/ThirdParty/HDF5/src/itkhdf5/src/CMakeFiles/H5make_libsettings.dir/flags.make

Modules/ThirdParty/HDF5/src/itkhdf5/src/CMakeFiles/H5make_libsettings.dir/H5make_libsettings.c.o: Modules/ThirdParty/HDF5/src/itkhdf5/src/CMakeFiles/H5make_libsettings.dir/flags.make
Modules/ThirdParty/HDF5/src/itkhdf5/src/CMakeFiles/H5make_libsettings.dir/H5make_libsettings.c.o: Modules/ThirdParty/HDF5/src/itkhdf5/src/H5make_libsettings.c
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/antoinerosset/ITK/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object Modules/ThirdParty/HDF5/src/itkhdf5/src/CMakeFiles/H5make_libsettings.dir/H5make_libsettings.c.o"
	cd /Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/H5make_libsettings.dir/H5make_libsettings.c.o   -c /Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5make_libsettings.c

Modules/ThirdParty/HDF5/src/itkhdf5/src/CMakeFiles/H5make_libsettings.dir/H5make_libsettings.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/H5make_libsettings.dir/H5make_libsettings.c.i"
	cd /Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5make_libsettings.c > CMakeFiles/H5make_libsettings.dir/H5make_libsettings.c.i

Modules/ThirdParty/HDF5/src/itkhdf5/src/CMakeFiles/H5make_libsettings.dir/H5make_libsettings.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/H5make_libsettings.dir/H5make_libsettings.c.s"
	cd /Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/H5make_libsettings.c -o CMakeFiles/H5make_libsettings.dir/H5make_libsettings.c.s

Modules/ThirdParty/HDF5/src/itkhdf5/src/CMakeFiles/H5make_libsettings.dir/H5make_libsettings.c.o.requires:
.PHONY : Modules/ThirdParty/HDF5/src/itkhdf5/src/CMakeFiles/H5make_libsettings.dir/H5make_libsettings.c.o.requires

Modules/ThirdParty/HDF5/src/itkhdf5/src/CMakeFiles/H5make_libsettings.dir/H5make_libsettings.c.o.provides: Modules/ThirdParty/HDF5/src/itkhdf5/src/CMakeFiles/H5make_libsettings.dir/H5make_libsettings.c.o.requires
	$(MAKE) -f Modules/ThirdParty/HDF5/src/itkhdf5/src/CMakeFiles/H5make_libsettings.dir/build.make Modules/ThirdParty/HDF5/src/itkhdf5/src/CMakeFiles/H5make_libsettings.dir/H5make_libsettings.c.o.provides.build
.PHONY : Modules/ThirdParty/HDF5/src/itkhdf5/src/CMakeFiles/H5make_libsettings.dir/H5make_libsettings.c.o.provides

Modules/ThirdParty/HDF5/src/itkhdf5/src/CMakeFiles/H5make_libsettings.dir/H5make_libsettings.c.o.provides.build: Modules/ThirdParty/HDF5/src/itkhdf5/src/CMakeFiles/H5make_libsettings.dir/H5make_libsettings.c.o

# Object files for target H5make_libsettings
H5make_libsettings_OBJECTS = \
"CMakeFiles/H5make_libsettings.dir/H5make_libsettings.c.o"

# External object files for target H5make_libsettings
H5make_libsettings_EXTERNAL_OBJECTS =

bin/H5make_libsettings: Modules/ThirdParty/HDF5/src/itkhdf5/src/CMakeFiles/H5make_libsettings.dir/H5make_libsettings.c.o
bin/H5make_libsettings: Modules/ThirdParty/HDF5/src/itkhdf5/src/CMakeFiles/H5make_libsettings.dir/build.make
bin/H5make_libsettings: Modules/ThirdParty/HDF5/src/itkhdf5/src/CMakeFiles/H5make_libsettings.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable ../../../../../../bin/H5make_libsettings"
	cd /Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/H5make_libsettings.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
Modules/ThirdParty/HDF5/src/itkhdf5/src/CMakeFiles/H5make_libsettings.dir/build: bin/H5make_libsettings
.PHONY : Modules/ThirdParty/HDF5/src/itkhdf5/src/CMakeFiles/H5make_libsettings.dir/build

Modules/ThirdParty/HDF5/src/itkhdf5/src/CMakeFiles/H5make_libsettings.dir/requires: Modules/ThirdParty/HDF5/src/itkhdf5/src/CMakeFiles/H5make_libsettings.dir/H5make_libsettings.c.o.requires
.PHONY : Modules/ThirdParty/HDF5/src/itkhdf5/src/CMakeFiles/H5make_libsettings.dir/requires

Modules/ThirdParty/HDF5/src/itkhdf5/src/CMakeFiles/H5make_libsettings.dir/clean:
	cd /Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src && $(CMAKE_COMMAND) -P CMakeFiles/H5make_libsettings.dir/cmake_clean.cmake
.PHONY : Modules/ThirdParty/HDF5/src/itkhdf5/src/CMakeFiles/H5make_libsettings.dir/clean

Modules/ThirdParty/HDF5/src/itkhdf5/src/CMakeFiles/H5make_libsettings.dir/depend:
	cd /Users/antoinerosset/ITK && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/antoinerosset/ITK /Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src /Users/antoinerosset/ITK /Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src /Users/antoinerosset/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src/CMakeFiles/H5make_libsettings.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : Modules/ThirdParty/HDF5/src/itkhdf5/src/CMakeFiles/H5make_libsettings.dir/depend

