# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Produce verbose output by default.
VERBOSE = 1

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/pzhang/chen/move-bed

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/pzhang/chen/move-bed

# Include any dependencies generated for this target.
include CMakeFiles/test_mvbed.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/test_mvbed.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/test_mvbed.dir/flags.make

CMakeFiles/test_mvbed.dir/test_mvbed.cpp.o: CMakeFiles/test_mvbed.dir/flags.make
CMakeFiles/test_mvbed.dir/test_mvbed.cpp.o: test_mvbed.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pzhang/chen/move-bed/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/test_mvbed.dir/test_mvbed.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/test_mvbed.dir/test_mvbed.cpp.o -c /home/pzhang/chen/move-bed/test_mvbed.cpp

CMakeFiles/test_mvbed.dir/test_mvbed.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test_mvbed.dir/test_mvbed.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pzhang/chen/move-bed/test_mvbed.cpp > CMakeFiles/test_mvbed.dir/test_mvbed.cpp.i

CMakeFiles/test_mvbed.dir/test_mvbed.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test_mvbed.dir/test_mvbed.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pzhang/chen/move-bed/test_mvbed.cpp -o CMakeFiles/test_mvbed.dir/test_mvbed.cpp.s

CMakeFiles/test_mvbed.dir/test_mvbed.cpp.o.requires:

.PHONY : CMakeFiles/test_mvbed.dir/test_mvbed.cpp.o.requires

CMakeFiles/test_mvbed.dir/test_mvbed.cpp.o.provides: CMakeFiles/test_mvbed.dir/test_mvbed.cpp.o.requires
	$(MAKE) -f CMakeFiles/test_mvbed.dir/build.make CMakeFiles/test_mvbed.dir/test_mvbed.cpp.o.provides.build
.PHONY : CMakeFiles/test_mvbed.dir/test_mvbed.cpp.o.provides

CMakeFiles/test_mvbed.dir/test_mvbed.cpp.o.provides.build: CMakeFiles/test_mvbed.dir/test_mvbed.cpp.o


# Object files for target test_mvbed
test_mvbed_OBJECTS = \
"CMakeFiles/test_mvbed.dir/test_mvbed.cpp.o"

# External object files for target test_mvbed
test_mvbed_EXTERNAL_OBJECTS =

test_mvbed: CMakeFiles/test_mvbed.dir/test_mvbed.cpp.o
test_mvbed: CMakeFiles/test_mvbed.dir/build.make
test_mvbed: /home/pzhang/pkg/hdf5-1.8.15-patch1/hl/src/.libs/libhdf5_hl.so
test_mvbed: /home/pzhang/pkg/hdf5-1.8.15-patch1/src/.libs/libhdf5.so
test_mvbed: /usr/lib/x86_64-linux-gnu/libsz.so
test_mvbed: /usr/lib/liblapack.so
test_mvbed: /usr/lib/libblas.so
test_mvbed: /usr/lib/x86_64-linux-gnu/libgsl.so
test_mvbed: /usr/lib/x86_64-linux-gnu/libgslcblas.so
test_mvbed: /home/pzhang/pkg/voro++-0.4.5/src/libvoro++.a
test_mvbed: /home/pzhang/pkg/tetgen1.4.3/libtetgen.a
test_mvbed: /home/pzhang/pkg/triangle1.6/libtriangle.a
test_mvbed: /home/pzhang/pkg/igraph-0.5.4/src/.libs/libigraph.so
test_mvbed: /home/pzhang/pkg/igraph-0.5.4/src/.libs/libdlamch.a
test_mvbed: CMakeFiles/test_mvbed.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/pzhang/chen/move-bed/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable test_mvbed"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test_mvbed.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/test_mvbed.dir/build: test_mvbed

.PHONY : CMakeFiles/test_mvbed.dir/build

CMakeFiles/test_mvbed.dir/requires: CMakeFiles/test_mvbed.dir/test_mvbed.cpp.o.requires

.PHONY : CMakeFiles/test_mvbed.dir/requires

CMakeFiles/test_mvbed.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/test_mvbed.dir/cmake_clean.cmake
.PHONY : CMakeFiles/test_mvbed.dir/clean

CMakeFiles/test_mvbed.dir/depend:
	cd /home/pzhang/chen/move-bed && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pzhang/chen/move-bed /home/pzhang/chen/move-bed /home/pzhang/chen/move-bed /home/pzhang/chen/move-bed /home/pzhang/chen/move-bed/CMakeFiles/test_mvbed.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/test_mvbed.dir/depend

