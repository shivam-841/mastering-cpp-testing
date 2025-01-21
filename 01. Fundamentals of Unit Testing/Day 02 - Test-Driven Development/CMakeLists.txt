cmake_minimum_required(VERSION 3.10)
project(TDDExample)

#Add GoogleTest
find_package(GTest REQUIRED)

#Add executable
add_executable(test_add test_add.cpp add.cpp)

#Link the GoogleTest libraries
target_link_libraries(test_add /opt/conda/lib/libstdc++.so.6 GTest::GTest GTest::Main)

