# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = "/workspaces/mastering-cpp-testing/01. Fundamentals of Unit Testing/Day 02 - Test-Driven Development"

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = "/workspaces/mastering-cpp-testing/01. Fundamentals of Unit Testing/Day 02 - Test-Driven Development/build"

# Include any dependencies generated for this target.
include CMakeFiles/test_add.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/test_add.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/test_add.dir/flags.make

CMakeFiles/test_add.dir/test_add.cpp.o: CMakeFiles/test_add.dir/flags.make
CMakeFiles/test_add.dir/test_add.cpp.o: ../test_add.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/workspaces/mastering-cpp-testing/01. Fundamentals of Unit Testing/Day 02 - Test-Driven Development/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/test_add.dir/test_add.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/test_add.dir/test_add.cpp.o -c "/workspaces/mastering-cpp-testing/01. Fundamentals of Unit Testing/Day 02 - Test-Driven Development/test_add.cpp"

CMakeFiles/test_add.dir/test_add.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test_add.dir/test_add.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/workspaces/mastering-cpp-testing/01. Fundamentals of Unit Testing/Day 02 - Test-Driven Development/test_add.cpp" > CMakeFiles/test_add.dir/test_add.cpp.i

CMakeFiles/test_add.dir/test_add.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test_add.dir/test_add.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/workspaces/mastering-cpp-testing/01. Fundamentals of Unit Testing/Day 02 - Test-Driven Development/test_add.cpp" -o CMakeFiles/test_add.dir/test_add.cpp.s

CMakeFiles/test_add.dir/add.cpp.o: CMakeFiles/test_add.dir/flags.make
CMakeFiles/test_add.dir/add.cpp.o: ../add.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/workspaces/mastering-cpp-testing/01. Fundamentals of Unit Testing/Day 02 - Test-Driven Development/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/test_add.dir/add.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/test_add.dir/add.cpp.o -c "/workspaces/mastering-cpp-testing/01. Fundamentals of Unit Testing/Day 02 - Test-Driven Development/add.cpp"

CMakeFiles/test_add.dir/add.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test_add.dir/add.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/workspaces/mastering-cpp-testing/01. Fundamentals of Unit Testing/Day 02 - Test-Driven Development/add.cpp" > CMakeFiles/test_add.dir/add.cpp.i

CMakeFiles/test_add.dir/add.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test_add.dir/add.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/workspaces/mastering-cpp-testing/01. Fundamentals of Unit Testing/Day 02 - Test-Driven Development/add.cpp" -o CMakeFiles/test_add.dir/add.cpp.s

# Object files for target test_add
test_add_OBJECTS = \
"CMakeFiles/test_add.dir/test_add.cpp.o" \
"CMakeFiles/test_add.dir/add.cpp.o"

# External object files for target test_add
test_add_EXTERNAL_OBJECTS =

test_add: CMakeFiles/test_add.dir/test_add.cpp.o
test_add: CMakeFiles/test_add.dir/add.cpp.o
test_add: CMakeFiles/test_add.dir/build.make
test_add: /opt/conda/lib/libstdc++.so.6
test_add: /opt/conda/lib/libgtest_main.so.1.11.0
test_add: /opt/conda/lib/libgtest.so.1.11.0
test_add: CMakeFiles/test_add.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir="/workspaces/mastering-cpp-testing/01. Fundamentals of Unit Testing/Day 02 - Test-Driven Development/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable test_add"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test_add.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/test_add.dir/build: test_add

.PHONY : CMakeFiles/test_add.dir/build

CMakeFiles/test_add.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/test_add.dir/cmake_clean.cmake
.PHONY : CMakeFiles/test_add.dir/clean

CMakeFiles/test_add.dir/depend:
	cd "/workspaces/mastering-cpp-testing/01. Fundamentals of Unit Testing/Day 02 - Test-Driven Development/build" && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "/workspaces/mastering-cpp-testing/01. Fundamentals of Unit Testing/Day 02 - Test-Driven Development" "/workspaces/mastering-cpp-testing/01. Fundamentals of Unit Testing/Day 02 - Test-Driven Development" "/workspaces/mastering-cpp-testing/01. Fundamentals of Unit Testing/Day 02 - Test-Driven Development/build" "/workspaces/mastering-cpp-testing/01. Fundamentals of Unit Testing/Day 02 - Test-Driven Development/build" "/workspaces/mastering-cpp-testing/01. Fundamentals of Unit Testing/Day 02 - Test-Driven Development/build/CMakeFiles/test_add.dir/DependInfo.cmake" --color=$(COLOR)
.PHONY : CMakeFiles/test_add.dir/depend

