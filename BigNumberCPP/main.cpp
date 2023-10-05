#include <iostream>
#include <windows.h>
#include <cmath>
#include "big_numbers.h"
#include "public_metods.h"

using namespace std;

int main()
{
    ///basic cmd interface

    int howManyNum, i = 0;
    bool noQuit = true;
    BigNumber chosenOption, * outputNumber;

    cout << "How many numbers you want to operate on?" << endl;
    cin >> howManyNum;

    BigNumber* arr = new BigNumber[howManyNum];

    cin.get();

    cout << "Now set numbers" << endl << endl;

    while (howManyNum > 0 && noQuit == true)
    {
        cout << endl << "Inject number: " << i + 1 << endl << endl;

        noQuit = arr[i].set_char_arr();
        i++;
        howManyNum--;
    }
    noQuit = true;
    howManyNum = i;

    system("cls");

    cout << "Array of given numbers:\n\n";
    for (int i = 0; i < howManyNum; i++)
    {
        cout << i << ". ";
        arr[i].printCharArray();
        cout << endl;
    }
    int index;
    cout << endl << "Commands:\n\n q to quit\n clear - to refresh arr\n \n MIN - find smallest number \n MAX - find biggest number \n \n To ADD and SUB numbers from index0,index1 and save them in index0 \n \n 0 = 0 + 1   - written this way\n " << endl;
    while (noQuit == true)
    {
        ///if to quit if you write q
        if(!chosenOption.set_char_arr())
            return 0;

        ///interpreting commands MIN, MAX,clear and adding, subtracting commands

        if (areCharArraysEqual(chosenOption.get_char_ptr(), "MAX", 3))
        {
            index = findMax(arr, howManyNum);
            cout << "MAX number is: " << index << ". " << endl;
            arr[index].printCharArray();
        }
        else if (areCharArraysEqual(chosenOption.get_char_ptr(), "MIN", 3))
        {
            index = findMin(arr, howManyNum);
            cout << "MIN number is: " << index << ". " << endl;
            arr[index].printCharArray();
        }
        else if (areCharArraysEqual(chosenOption.get_char_ptr(), "clear", 5))
        {
            system("cls");
            cout << "Array of given numbers:\n\n";
            for (int i = 0; i < howManyNum; i++)
            {
                cout << i << ". ";
                arr[i].printCharArray();
                cout << endl;
            }
            cout << endl << "Commands:\n\n q to quit\n clear - to refresh arr\n \n MIN - find smallest number \n MAX - find biggest number \n \n To ADD and SUB numbers from index0,index1 and save them in index0 \n \n 0 = 0 + 1   - written this way\n " << endl;
        }
        else if(areCharArraysEqual(chosenOption.get_char_ptr(), "q", 1))
        {
            return 0;
        }

        else if (isdigit(int(chosenOption.get_char_ptr()[0])))
        {
            stack_output_num* numbersFromExpression = nullptr;
            int temp_int = 0, output_index, firstNumIndex, secondNumIndex, thirdNumIndex;
            char temp_char = 'x', sign;
            int i = 0, j = 0;

            while (chosenOption.get_char_ptr()[i] != ' ')
            {
                temp_char = chosenOption.get_char_ptr()[i];
                push2Stack(temp_char, numbersFromExpression);
                i++;
            }
            output_index = i;
            i = 0;
            while (numbersFromExpression != nullptr)
            {
                temp_char = popFromStack(numbersFromExpression);
                temp_int += (temp_char - 48) * pow(10, i);
                i++;
            }
            i += 3;
            firstNumIndex = temp_int;
            temp_int = 0;
            while (chosenOption.get_char_ptr()[i] != ' ')
            {
                temp_char = chosenOption.get_char_ptr()[i];
                push2Stack(temp_char, numbersFromExpression);

                i++;
            }
            output_index = i;
            i = 0;
            while (numbersFromExpression != nullptr)
            {
                temp_char = popFromStack(numbersFromExpression);
                temp_int += (temp_char - 48) * pow(10, i);
                i++;
            }

            i = output_index;
            i++;
            sign = chosenOption.get_char_ptr()[i];
            i = i + 2;

            secondNumIndex = temp_int;
            temp_int = 0;

            while (isdigit(int(chosenOption.get_char_ptr()[i])))
            {
                temp_char = chosenOption.get_char_ptr()[i];
                push2Stack(temp_char, numbersFromExpression);

                i++;
            }

            i = 0;
            while (numbersFromExpression != nullptr)
            {
                temp_char = popFromStack(numbersFromExpression);
                temp_int += (temp_char - 48) * pow(10, i);
                i++;
            }

            thirdNumIndex = temp_int;

            if (sign == '+')
            {
                arr[firstNumIndex].set_char_arr(arr[secondNumIndex] + arr[thirdNumIndex]);
                cout << "Output number is: ";
                arr[firstNumIndex].printCharArray();

            }
            else if (sign = '-')
            {
                cout << "Output number is: ";
                arr[firstNumIndex].set_char_arr(arr[secondNumIndex] - arr[thirdNumIndex]);
                arr[firstNumIndex].printCharArray();
            }
            else
            {
                return 0;
            }
        }

        else
        {
            cout << "Wrong command. Try again!" << endl;
        }
    }
}


