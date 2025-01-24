#include "gtest/gtest.h"
#include "gmock/gmock.h"
#include "example_mock.hpp"

using ::testing::Return;

// Test Case 1
TEST(ExampleTest, AddTest) {
    Mock_Example = new MockExample();

    EXPECT_CALL(*Mock_Example, add(3, 4)).WillOnce(Return(7));
    EXPECT_EQ(Mock_Example->add(3, 4), 7);
}

// Test Case 2
TEST(ExampleTest, MultiplyTest) {
    Mock_Example = new MockExample();

    EXPECT_CALL(*Mock_Example, multiply(3, 4)).WillOnce(Return(12));
    EXPECT_EQ(Mock_Example->multiply(3, 4), 12);
}

// Main function to initialize and run all tests
int main(int argc, char **argv) {
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}
