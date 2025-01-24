#ifndef EXAMPLE_MOCK_HPP
#define EXAMPLE_MOCK_HPP

#include "gmock/gmock.h"
#include "example.hpp"

class MockExample : public Example {
public:
//Syntax for Mocking each function MOCK_METHOD(return_type, function_name, (parameters),(override));
    MOCK_METHOD(int, add, (int a, int b), ());
    MOCK_METHOD(int, multiply, (int a, int b), ());

/* Another Simple Method
    MOCK_METHOD2(add, int(int a, intb)); // 2 means number of parameters passed to add function
*/
};

MockExample* Mock_Example = nullptr;

int Example :: add(int a, int b){
    return Mock_Example -> add(a,b);
}

int Example :: multiply(int a, int b){
    return Mock_Example -> multiply(a,b);
}

#endif 
