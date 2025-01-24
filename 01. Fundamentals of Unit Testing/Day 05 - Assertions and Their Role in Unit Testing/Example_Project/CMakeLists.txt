cmake_minimum_required(VERSION 3.10)

project(ExampleProject)

# Enable C++17
set(CMAKE_CXX_STANDARD 17)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pthread")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -pthread")

# Specify the path to the libraries and headers (if needed)
set(GTEST_INCLUDE_DIRS "/workspaces/mastering-cpp-testing/01. Fundamentals of Unit Testing/Day 05 - Assertions and Their Role in Unit Testing/Example_Project/googletest/googletest/include")
set(GMOCK_INCLUDE_DIRS "/workspaces/mastering-cpp-testing/01. Fundamentals of Unit Testing/Day 05 - Assertions and Their Role in Unit Testing/Example_Project/googletest/googletest/include/gmock")

# Set the paths for the static libraries (libgmock.a and libgtest.a)
set(GTEST_LIBRARIES "/workspaces/mastering-cpp-testing/01. Fundamentals of Unit Testing/Day 05 - Assertions and Their Role in Unit Testing/Example_Project/googletest/build/lib/libgtest.a")
set(GMOCK_LIBRARIES "/workspaces/mastering-cpp-testing/01. Fundamentals of Unit Testing/Day 05 - Assertions and Their Role in Unit Testing/Example_Project/googletest/build/lib/libgmock.a")

# Include directories
include_directories(${GTEST_INCLUDE_DIRS} ${GMOCK_INCLUDE_DIRS})

# Example library
add_library(example STATIC example.cpp)

# Unit test executable
add_executable(ut_example UT_GMOCK_Example.cpp)

# Link GoogleTest, GoogleMock, and pthread (on Unix-like systems)
target_link_libraries(ut_example example ${GTEST_LIBRARIES} ${GMOCK_LIBRARIES} pthread)

# Enable testing
enable_testing()

# Register tests
add_test(NAME ExampleTest COMMAND ut_example)
