#include <iostream>

using namespace std;

struct stackElement
{
    int m_data;
    stackElement* m_ptr=nullptr;
};

void push2Stack(stackElement* &top,int data)
{
    stackElement *newEl = new stackElement;
    newEl->m_data=data;
    newEl->m_ptr=top;
    top=newEl;
}

int peekFromStack(stackElement *&top)
{

    if(top!=nullptr)
        cout<<top->m_data;
    return 1;
}

void popFromStack(stackElement* &top)
{
    if(top==nullptr)
    {
         return;
    }


    stackElement *temp = top;
    top=top->m_ptr;
    delete temp;
}

void printStack(stackElement *top)
{
    while(top!=nullptr)
    {
        cout<<top->m_data<<" ";
        top=top->m_ptr;
    }
}

void deleteStack(stackElement *&top)
{
    if(top==nullptr)
    {
         return;
    }

    stackElement *temp;

    while(top!=nullptr)
    {
        temp = top;
        top=top->m_ptr;
        delete temp;
    }
}

int main()
{
    stackElement *test=nullptr;
    cout<<"push and print"<<endl;
    push2Stack(test,1);
    push2Stack(test,2);
    push2Stack(test,3);
    push2Stack(test,4);
    push2Stack(test,5);
    printStack(test);

    cout<<endl;
    cout<<endl;

    cout<<"pop 2 elements and print:"<<endl;
    popFromStack(test);
    popFromStack(test);
    printStack(test);

    cout<<endl<<"peek: ";
    peekFromStack(test);

    cout<<endl<<endl<<"one more print:"<<endl;
    printStack(test);
    cout<<endl<<endl;

    cout<<"clear whole stack"<<endl;
    deleteStack(test);

    cout<<"print stack:"<<endl;
    printStack(test);

}
