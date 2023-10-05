#pragma once
#include "big_numbers.h"

///struct stack implementation
struct stack_output_num
{
    char num = '\0';
    stack_output_num* under = nullptr;
};

void push2Stack(char addNum, stack_output_num*& top);
void printStack(stack_output_num* top);
char popFromStack(stack_output_num*& top);

///update arr to reallocate arr that is too small
char* update_arr(char* im, unsigned int& oldSize);

///smallest/bigges num, checked by these class methods:  bool isGreaterThan(BigNumber& secondNum);     bool isSmallerThan(BigNumber& secondNum);

int findMin(BigNumber* arr, int numberOfArrayElements);
int findMax(BigNumber* arr, int numberOfArrayElements);

///used for interface purpose (MIN MAX clear etc.)
bool areCharArraysEqual(char* first_arr, char* second_arr, int numberOfElements);
