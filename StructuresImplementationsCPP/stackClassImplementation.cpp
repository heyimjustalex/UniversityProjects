#include <iostream>

using namespace std;
struct node
{
    int m_data;
    node *m_next=nullptr;

};

class stackSt
{
private:

    int m_actSize=0;
    node *m_top=nullptr;

public:
    void push(int data);
    int pop();
    void print();
    int getActSize();
    int getTopData();

    stackSt() {}
    ~stackSt()
    {
        while(m_top!=nullptr)
            pop();
    }
};

int stackSt::getActSize()
{
    return m_actSize;
}
int stackSt::getTopData()
{
    return m_top->m_data;
}
void stackSt::push(int data)
{
    node *new_el = new node;
    new_el->m_data=data;

    new_el->m_next=m_top;
    m_top=new_el;

    ++m_actSize;
}

int stackSt::pop()
{
    int val=0;
    node* temp=m_top;
    if(m_top!=nullptr)
    {
        val=m_top->m_data;
        m_top=m_top->m_next;
        --m_actSize;
         delete temp;
    }

    return val;
}

void stackSt::print()
{
    node* temp=m_top;
    while(temp!=nullptr)
    {
        cout<<temp->m_data<<" ";
        temp=temp->m_next;
    }
}

int main()
{
    stackSt test;
    test.push(5);
    test.push(2);
    test.push(1);
    test.push(9);

    test.print();
    cout<<endl<<"size is: "<<test.getActSize()<<endl;
    test.pop();
    test.pop();

    cout<<endl;
    test.print();


    cout<<endl<<"top data "<<test.getTopData()<<endl;
    test.~stackSt();
    cout<<endl;
    test.print();


}
