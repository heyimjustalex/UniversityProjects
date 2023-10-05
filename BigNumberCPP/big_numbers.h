#pragma once

class BigNumber
{
    /// char_ptr to get numbers from user
    /// int_ptr to perform operations at every num of string
    /// arr_Length how long is char_ptr, it's !=numberOfEl, cause might be longer due to reallocation with update_arr
    /// numberOfEl - no of el in char_ptr

    char* m_ptr_char;
    int* m_ptr_int = { 0 };
    unsigned int m_arrLength = 0;
    unsigned int m_numberOfEl = 0;

public:

    BigNumber()
    {
        m_ptr_char = new char[1];
    }

    BigNumber operator- (BigNumber& secondNum);
    BigNumber operator+ (BigNumber& secondNum);

    bool set_char_arr();
    bool set_char_arr(BigNumber number2);
    char* get_char_ptr();

    void printCharArray();
    void printIntArray();

    void rewriteCharArrayToInt();

    ///adding or deleting minus from m_char_ptr[0]
    void add_minus_to_array();
    void del_minus_from_array();

    ///funtion used by overloaded + and - operators
    BigNumber add_numbers_bothPlusOrMinus(BigNumber& secondNum);
    BigNumber sub_numbers_bothPlusOrMinus(BigNumber& secondNum);

    ///these are bigNum > and < operators
    bool isGreaterThan(BigNumber& secondNum);
    bool isSmallerThan(BigNumber& secondNum);

    ///is BigNumber a minus number
    bool isMinus();

};

