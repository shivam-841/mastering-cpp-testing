## Key Learning Points

### Test Success vs. Test Failure
- A test is successful if the actual output matches the expected output.
- A test fails when the actual output doesn't match the expected output or an error occurs during the test.

### Interpreting Test Results
- **Passed Tests**: Indicate that the code works as expected for the given test cases.
- **Failed Tests**: Provide insight into what part of your code needs to be fixed. Failures help identify bugs and weaknesses in your code.

### Handling Failures
- Use the failure output to identify where your code is going wrong.
- Once identified, fix the issue and rerun the test to ensure it passes.
- Test failures are not bad; they are an opportunity to improve the code.

### Test-Driven Development (TDD)
- In TDD, you often start by writing tests that fail (because the feature isn't implemented yet).
- Then, you write code that makes the test pass.
- Repeating this cycle helps ensure that code is always written to meet specific requirements.

## Getting Started

To begin using Google Test and Google Mock, follow these steps:

### Prerequisites

- Day 05 : Example Project Section must be completed. And the below test cases can be added there

## Examples

### Example 1: Simple Addition Test

This example demonstrates a successful unit test for an `add` function.

```cpp
TEST(AdditionTest, AddPositiveNumbers) {
    int result = add(2, 3);
    EXPECT_EQ(result, 5);  // Expect the result to be 5
}
```

```bash
[ RUN      ] AdditionTest.AddPositiveNumbers
[       OK ] AdditionTest.AddPositiveNumbers (0 ms)
```

### Example 2: Failing Test due to Incorrect Expected Value

```cpp
TEST(AdditionTest, AddNegativeNumbers) {
    int result = add(-2, -3);
    EXPECT_EQ(result, -6);  // This is wrong, -2 + -3 = -5
}
```
```bash
    [ RUN      ] AdditionTest.AddNegativeNumbers
    [  FAILED  ] AdditionTest.AddNegativeNumbers (0 ms)
```

### Handling Division by Zero

```cpp
    int divide(int a, int b) {
    if (b == 0) {
        throw std::invalid_argument("Division by zero");
    }
    return a / b;
}

TEST(DivideTest, DivideByZero) {
    EXPECT_THROW(divide(10, 0), std::invalid_argument);  // Expect an exception when dividing by zero
}
```

# How to Handle Test Failures

1. **Write a failing test**: Start by writing a test that doesn't pass because the code is incomplete or incorrect.
2. **Run the test**: Execute your tests and confirm that the test fails as expected.
3. **Fix the issue**: Identify the root cause of the failure by reading the error message and reviewing your code.
4. **Re-run the tests**: After fixing the code, re-run the tests to ensure that the issue is resolved and the test passes.
