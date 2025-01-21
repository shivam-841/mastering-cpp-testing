# Test-Driven Development (TDD) Notes

## Overview

Test-Driven Development (TDD) is a software development methodology where tests are written before the actual code. It helps ensure code correctness and improves code quality from the start. TDD follows a simple cycle of writing tests, writing code to make the tests pass, and then refactoring the code.

## Process of TDD

1. **Run all Test Cases**:  
   Ensure that all test cases are executed, and confirm that the new test case fails.

2. **Red Phase**:  
   - **Create a test case**: Write a new test case for the functionality you plan to implement.  
   - **Make it fail**: Run the test to confirm it fails as no code has been written yet.

3. **Green Phase**:  
   - **Make the test pass**: Write the code necessary to make the test pass, even if the solution is not the most optimal.

4. **Refactor Phase**:  
   - **Remove redundancy**: Refactor the code to eliminate duplication or redundancy.  
   - **Improve code quality**: Enhance the code without altering its functionality.

5. **Repeat**:  
   Repeat the process (Red, Green, Refactor) for each new feature or functionality.

## Key Points

- The TDD cycle repeats for every new feature or functionality.
- TDD ensures that code is correct from the beginning and encourages the development of small, manageable pieces of functionality.

## Approaches to TDD

### 1. Inside Out
- Focuses on writing unit tests for the core logic or lower-level code first, then gradually building up to higher-level functionalities.

### 2. Outside In
- Starts by writing tests for higher-level features or user stories and then works inwards, focusing on the components and logic required to pass the tests.

## Types of TDD

### 1. ATDD (Acceptance Test-Driven Development)
- Focuses on writing acceptance tests to define the expected behavior of a feature from the perspective of the customer or end user before development begins.

### 2. DTDD (Developer Test-Driven Development)
- Involves developers writing unit tests to verify the correctness of the code they write. The tests focus on the internal functionality and logic of the code.

## References

- [GeeksforGeeks - Test Driven Development (TDD)](https://www.geeksforgeeks.org/test-driven-development-tdd/)  
- [YouTube - Test Driven Development (TDD) Explanation](https://www.youtube.com/watch?v=h26wrTxF94k)

# **Test-Driven Development (TDD) in C++ with Google Test (GTest)**

## **Overview**
This repository demonstrates the process of implementing **Test-Driven Development (TDD)** in **C++** using the **Google Test (GTest)** framework. It includes step-by-step instructions for setting up Google Test, writing and running tests, and resolving common build issues related to library conflicts, such as those involving `libstdc++` and `libcurl`.

## **Contents**
1. [Prerequisites](#prerequisites)
2. [Steps to Implement TDD in C++](#steps-to-implement-tdd-in-c++)
3. [Test-Driven Development (TDD) Setup: Resolving Build Issues with Google Test (GTest)](#test-driven-development-tdd-setup-resolving-build-issues-with-google-test-gtest)
4. [Conclusion](#conclusion)


## **Prerequisites**
Before you begin, ensure that the following tools and libraries are installed:

- **Google Test Framework**: Used for unit testing in C++.
  - [Google Test Installation Guide](https://github.com/google/googletest)
  
- **C++ Compiler**: (e.g., GCC, Clang)

- **CMake**: A build system to manage the project.

For Linux-based systems, you can install Google Test and CMake using the following commands:

```bash
sudo apt-get install libgtest-dev
sudo apt-get install cmake
```


## **Steps to Implement TDD in C++**

### **1. Set Up the Test Framework (Google Test)**

To begin, install **Google Test** and set up the environment for compiling and running C++ tests. For instructions, follow the [Google Test installation guide](https://github.com/google/googletest).

### **2. Write the First Test (Red Phase)**

In the **Red** phase, write a test that will initially fail because the function has not been implemented yet.

#### **Test File: `test_add.cpp`**

Create a file named `test_add.cpp` and add the following test cases:

```cpp
#include <gtest/gtest.h>

// Forward declaration of the function we're going to implement
int add_numbers(int a, int b);

// Test case for the add_numbers function
TEST(AdditionTest, HandlesPositiveNumbers) {
    EXPECT_EQ(add_numbers(2, 3), 5);  // Expect that 2 + 3 = 5
}

TEST(AdditionTest, HandlesNegativeNumbers) {
    EXPECT_EQ(add_numbers(-2, -3), -5);  // Expect that -2 + -3 = -5
}

TEST(AdditionTest, HandlesZero) {
    EXPECT_EQ(add_numbers(0, 0), 0);  // Expect that 0 + 0 = 0
    EXPECT_EQ(add_numbers(0, 3), 3);  // Expect that 0 + 3 = 3
}
```

### **3. Write Just Enough Code to Pass the Test (Green Phase)**

In the **Green** phase, implement just enough code to make the test pass.

#### **Implementation File: `add.cpp`**

Create a new file named `add.cpp` and implement the `add_numbers` function:

```cpp
// Implement the add_numbers function
int add_numbers(int a, int b) {
    return a + b;
}
```

### **4. Run the Tests**

To build and run the tests, create a `CMakeLists.txt` file to manage the project build:

#### **CMakeLists.txt**

```cmake
cmake_minimum_required(VERSION 3.10)
project(TDDExample)

# Add GoogleTest
find_package(GTest REQUIRED)

# Add executable
add_executable(test_add test_add.cpp add.cpp)

# Link the GoogleTest libraries
target_link_libraries(test_add GTest::GTest GTest::Main)
```

#### **Build and Run:**

```bash
mkdir build
cd build
cmake ..
make
./test_add
```

If everything is set up correctly, the tests should pass, confirming that the `add_numbers` function works as expected.

### **5. Refactor the Code (Refactor Phase)**

In the **Refactor** phase, clean up the code without changing its behavior. This is optional for simple functions but recommended for larger projects. After refactoring, run the tests again to ensure the functionality is intact.

---

## **Test-Driven Development (TDD) Setup: Resolving Build Issues with Google Test (GTest)**

### **Objective:**
Resolve common build issues related to conflicting library versions, particularly with **libstdc++** and **libcurl**, when setting up **Google Test**.

### **1. Environment Setup & Dependencies**

We encountered several build issues when trying to compile a C++ project using Google Test, including:

- **Conflicting library versions** between Conda's libraries and system libraries, especially `libstdc++`.
- **Linker errors** due to missing symbols like `std::__throw_bad_array_new_length()`, indicating version mismatches in `libstdc++`.
- Warnings related to **libcurl** version mismatch in CMake, although these were not blocking the build.

### **2. Steps Taken to Resolve Issues**

#### **a. Prioritize Conda Libraries in the Environment**
To prioritize the correct Conda libraries, we adjusted the `LD_LIBRARY_PATH`:

```bash
export LD_LIBRARY_PATH=/opt/conda/lib:$LD_LIBRARY_PATH
```

This change ensures that Conda's version of `libstdc++` is used, avoiding conflicts with system libraries.

#### **b. Explicitly Link to the Correct `libstdc++` Version**
We modified the `CMakeLists.txt` file to explicitly link to the correct version of `libstdc++` provided by Conda:

```cmake
target_link_libraries(test_add /opt/conda/lib/libstdc++.so.6 GTest::GTest GTest::Main)
```

#### **c. Rebuilding Google Test (GTest)**
Since Google Test may have been compiled with an older version of `libstdc++`, we rebuilt Google Test to use the correct version:

```bash
cd /path/to/googletest
mkdir build
cd build
cmake ..
make
sudo make install
```

#### **d. Clean and Rebuild the Project**
After making these changes, clean and rebuild the project:

```bash
make clean
cmake ..
make
```

#### **e. Handling `libcurl` Warnings**
Although we received warnings related to `libcurl.so.4`, they did not block the build process. We chose to ignore them for now.

### **3. Final Outcome**

After implementing the fixes, the build process completed successfully without the linker error, and the test executable (`test_add`) was generated. Warnings related to `libcurl` persisted but did not affect the functionality or block the build.

You can now run the test executable:

```bash
./test_add
```

### **4. Key Takeaways**

- **Setting `LD_LIBRARY_PATH`** ensures that Conda's libraries are prioritized over system libraries.
- Explicitly **linking libraries** in `CMakeLists.txt` resolves version mismatch issues.
- **Rebuilding dependencies** like Google Test ensures compatibility with the correct library versions.
- **Ignoring non-critical warnings**, such as those related to `libcurl`, may be acceptable if they do not block the build.

---

## **Conclusion**

We successfully set up a **Test-Driven Development (TDD)** environment in C++ using **Google Test**, and resolved issues related to conflicting library versions (`libstdc++` and `libcurl`). This process ensures that the code is well-tested and built correctly, and helps avoid future compatibility issues.

This **README.md** provides a complete overview of the steps to set up and use **Test-Driven Development (TDD)** with **Google Test (GTest)**, as well as resolving common build issues related to conflicting libraries (`libstdc++` and `libcurl`)