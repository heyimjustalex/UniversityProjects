#include "public_metods.h"


void push2Stack(char addNum, stack_output_num*& top)
{
    stack_output_num* newEl = new stack_output_num;
    newEl->num = addNum;
    newEl->under = top;
    top = newEl;
}

char popFromStack(stack_output_num*& top)
{
    if (top == nullptr)
        return 0;

    stack_output_num* temp = top;
    char num = top->num;
    top = top->under;
    delete temp;

    return num;
}

void printStack(stack_output_num* top)
{
    while (top != nullptr)
    {
        top = top->under;
    }
}

char* update_arr(char* ptr, unsigned int& oldSize)
{
    int temp = oldSize;
    oldSize += 10;

    char* newT = new char[oldSize];

    for (int i = 0; i < temp; i++)
    {
        newT[i] = ptr[i];
    }
    delete[] ptr;

    return newT;
}

bool areCharArraysEqual(char* first_arr, char* second_arr, int numberOfElements)
{
    for (int i = 0; i < numberOfElements; i++)
    {
        if (first_arr[i] != second_arr[i])
        {
            return false;
        }
    }
    return true;
}



