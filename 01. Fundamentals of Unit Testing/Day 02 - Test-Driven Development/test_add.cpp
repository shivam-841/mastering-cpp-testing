#include <gtest/gtest.h>

int add_numbers(int a, int b);

TEST(AdditionTest,HandlesPositiveNumbers){
    EXPECT_EQ(add_numbers(2,3),5);
}

TEST(AdditionTest,HandlesNegativeNumbers){
    EXPECT_EQ(add_numbers(-2,-3),-5);
}

TEST(AdditionTest, HandlesZero) {
    EXPECT_EQ(add_numbers(0, 0), 0);
    EXPECT_EQ(add_numbers(0, 3), 3);
}