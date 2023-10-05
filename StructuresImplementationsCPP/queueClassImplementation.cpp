#include <iostream>

using namespace std;

struct node
{
    int m_data;
    node* m_next=nullptr;
};

class queueSt
{
    node* m_head=nullptr;
    node* m_tail=nullptr;
    int m_noOfEl=0;

public:
    void enqueue(int data)
    {
        node* new_el = new node;
        new_el->m_data=data;

        if(m_head!=nullptr)
        {
            m_tail->m_next=new_el;
        }
        m_tail=new_el;

        if(m_head==nullptr)
        {
            m_head=new_el;
        }

        ++m_noOfEl;
    }

    void print()
    {
        node *temp = m_head;

        while(temp!=nullptr)
        {
            cout<<temp->m_data<<" ";
            temp=temp->m_next;
        }
    }

    int pop()
    {
        node *temp;
        int val=0;
        if(m_head!=nullptr)
        {
            temp=m_head;
            m_head=m_head->m_next;
            --m_noOfEl;
             val= temp->m_data;
            delete temp;
        }

        return val;
    }

    ~queueSt()
    {
        while(m_head!=nullptr)
        {
            pop();
        }
    }


};

int main()
{
    queueSt test;
    test.enqueue(2);
    test.enqueue(3);
    test.enqueue(4);
    test.enqueue(5);
    test.enqueue(6);

    test.print();
    cout<<endl;
    cout<<test.pop();
    cout<<endl;
    test.print();
    cout<<endl<<"destructor:"<<endl;
    test.~queueSt();
    test.print();

}
