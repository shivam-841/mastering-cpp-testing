# C++ Unit Testing with Google Test - Common Assertions

This document covers common assertions used in C++ testing frameworks like **Google Test**, the difference between `ASSERT_*` and `EXPECT_*`, and examples of how to use them in unit tests.

## 1. Common Assertions in C++ Testing Frameworks

Testing frameworks like **Google Test** provide assertions to validate conditions in your unit tests. These assertions help verify that your code behaves as expected. Below are some commonly used assertions:

- **`ASSERT_EQ(val1, val2)`**:  
  Checks if `val1` is equal to `val2`. If they are not equal, the test fails and the function is aborted immediately.

- **`ASSERT_NE(val1, val2)`**:  
  Checks if `val1` is not equal to `val2`. If they are equal, the test fails and the function is aborted.

- **`ASSERT_TRUE(condition)`**:  
  Checks if `condition` is true. If it’s false, the test fails and the function is aborted.

- **`ASSERT_FALSE(condition)`**:  
  Checks if `condition` is false. If it’s true, the test fails and the function is aborted.

- **`EXPECT_EQ(val1, val2)`**:  
  Like `ASSERT_EQ`, but the test doesn’t stop if the assertion fails. It will continue running subsequent checks.

- **`EXPECT_NE(val1, val2)`**:  
  Like `ASSERT_NE`, but it will allow the test to continue running even if the assertion fails.

- **`EXPECT_TRUE(condition)`**:  
  Like `ASSERT_TRUE`, but it allows the test to continue even if the condition is false.

- **`EXPECT_FALSE(condition)`**:  
  Like `ASSERT_FALSE`, but allows the test to continue even if the condition is true.

## 2. Difference Between `ASSERT_*` and `EXPECT_*`

- **`ASSERT_*`** assertions cause the test to stop immediately if they fail. Once an assertion fails, the test function is aborted, and any subsequent checks in the same test will not be executed.

- **`EXPECT_*`** assertions allow the test to continue even if they fail. This is particularly useful when you want to check multiple conditions in a single test and don’t want the failure of one assertion to prevent the other checks from running.

### When to Use `ASSERT_*` vs `EXPECT_*`:
- Use **`ASSERT_*`** when failure of the assertion should immediately stop the test. This is appropriate when the test cannot continue meaningfully without the failed condition.
- Use **`EXPECT_*`** when you want the test to continue even if one of the assertions fails. This is useful when you want to check multiple conditions but don't want the failure of one to prevent other checks from being evaluated.


Here is the markdown for the documentation you provided:

```markdown
# Documentation for the Example Project with Google Test and Google Mock Integration

This documentation provides a comprehensive guide for setting up and using Google Test (gtest) and Google Mock (gmock) in your project, as well as explaining the structure and functionality of the provided code.

---

## Project Structure

The project contains the following files:

- **example.hpp**: Header file that defines the `Example` class with two methods: `add` and `multiply`.
- **example.cpp**: Implementation file for the `Example` class methods.
- **example_mock.hpp**: Contains the mock implementation of the `Example` class using Google Mock.
- **UT_GMOCK_Example.cpp**: Unit test file that defines the test cases for the `Example` class, utilizing Google Test and Google Mock.
- **CMakeLists.txt**: CMake configuration file to build the project and link necessary libraries (Google Test, Google Mock).

---

## Code Overview

### **1. example.hpp**

This header file defines the `Example` class, which includes the following methods:

```cpp
class Example {
public:
    int add(int a, int b);
    int multiply(int a, int b);
};
```

### **2. example.cpp**

This file contains the implementation of the `add` and `multiply` methods of the `Example` class:

```cpp
#include "example.hpp"

int Example::add(int a, int b) {
    return a + b;
}

int Example::multiply(int a, int b) {
    return a * b;
}
```

### **3. example_mock.hpp**

This file defines the `MockExample` class, which uses Google Mock to create mock versions of the `add` and `multiply` methods. The `MockExample` class inherits from `Example` and uses `MOCK_METHOD` to specify mock versions of the methods.

```cpp
class MockExample : public Example {
public:
    MOCK_METHOD(int, add, (int a, int b), ());
    MOCK_METHOD(int, multiply, (int a, int b), ());
};
```

The `MockExample` class is then used to simulate the behavior of the `Example` class in unit tests.

### **4. UT_GMOCK_Example.cpp**

This file defines the unit tests using Google Test and Google Mock. It includes two test cases:

- **AddTest**: Verifies that the `add` method of `MockExample` works as expected.
- **MultiplyTest**: Verifies that the `multiply` method of `MockExample` works as expected.

Test cases use `EXPECT_CALL` to define mock behavior and verify that the correct return values are returned.

```cpp
TEST(ExampleTest, AddTest) {
    Mock_Example = new MockExample();
    EXPECT_CALL(*Mock_Example, add(3, 4)).WillOnce(Return(7));
    EXPECT_EQ(Mock_Example->add(3, 4), 7);
}

TEST(ExampleTest, MultiplyTest) {
    Mock_Example = new MockExample();
    EXPECT_CALL(*Mock_Example, multiply(3, 4)).WillOnce(Return(12));
    EXPECT_EQ(Mock_Example->multiply(3, 4), 12);
}
```

### **5. CMakeLists.txt**

This file contains the necessary configurations for building the project using CMake. It sets up the project, includes the required directories for Google Test and Google Mock, and specifies the libraries to link with.

```cmake
cmake_minimum_required(VERSION 3.10)

project(ExampleProject)

# Enable C++17
set(CMAKE_CXX_STANDARD 17)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pthread")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -pthread")

# Specify the path to the libraries and headers (if needed)
set(GTEST_INCLUDE_DIRS "/path/to/googletest/googletest/include")
set(GMOCK_INCLUDE_DIRS "/path/to/googletest/googletest/include/gmock")

# Set the paths for the static libraries (libgmock.a and libgtest.a)
set(GTEST_LIBRARIES "/path/to/googletest/build/lib/libgtest.a")
set(GMOCK_LIBRARIES "/path/to/googletest/build/lib/libgmock.a")

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
```

---

## Installing and Setting Up Google Test and Google Mock

1. **Download Google Test and Google Mock**:  
   - Clone the Google Test repository from GitHub:

     ```bash
     git clone --recursive https://github.com/google/googletest.git
     ```

2. **Build Google Test and Google Mock**:  
   - Navigate to the `googletest` directory:

     ```bash
     cd googletest
     ```

   - Create a build directory and compile:

     ```bash
     mkdir build
     cd build
     cmake ..
     make
     ```

3. **Set Up the Paths**:  
   - Update the `CMakeLists.txt` file in your project to include the correct paths for the Google Test and Google Mock headers and libraries:
     
     - Set `GTEST_INCLUDE_DIRS` and `GMOCK_INCLUDE_DIRS` to point to the `googletest` and `gmock` include directories.
     - Set `GTEST_LIBRARIES` and `GMOCK_LIBRARIES` to point to the compiled libraries (`libgtest.a` and `libgmock.a`).

4. **Build Your Project**:  
   - In the root of your project, create a build directory and run CMake to configure the project:

     ```bash
     mkdir build
     cd build
     cmake ..
     make
     ```

5. **Run the Tests**:  
   - Once the project is built, run the tests using the following command:

     ```bash
     ./ut_example
     ```

   - The tests will execute, and the results will be printed to the terminal.

---

## Conclusion

This project demonstrates how to integrate Google Test and Google Mock into a C++ project for unit testing. By following this documentation, you should be able to set up and test your own code with mock dependencies, enabling you to perform unit testing more effectively.
```

This markdown preserves the structure and content you provided while ensuring proper formatting for readability in a markdown environment. Let me know if you'd like to make any changes!