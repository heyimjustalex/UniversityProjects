#include <iostream>

using namespace std;

struct queueEl
{
    int m_data;
    queueEl* m_next=nullptr;
};

struct queueSt
{
    queueEl* m_head=nullptr;
    queueEl* m_tail=nullptr;
};

void addQueueEl(queueSt &q, int data)
{
    queueEl* nextEl = new queueEl;
    nextEl->m_data=data;

    if(q.m_head!=nullptr)
    {
        q.m_tail->m_next=nextEl;
    }

    q.m_tail=nextEl;

    if(q.m_head==nullptr)
    {
        q.m_head=nextEl;
    }

}

int getQueueHead(const queueSt &q)
{
   if(q.m_head!=nullptr)
        return q.m_head->m_data;
    return 0;
}

int getQueueTail(const queueSt &q)
{
   if(q.m_tail!=nullptr)
        return q.m_tail->m_data;
    return 0;
}

void printQueue(queueSt q)
{
    while(q.m_head!=nullptr)
    {
        cout<<q.m_head->m_data<<" ";
        q.m_head=q.m_head->m_next;
    }
}
int main()
{
    queueSt test;
    addQueueEl(test,1);
    addQueueEl(test,2);
    addQueueEl(test,3);
    cout<<getQueueHead(test);
    cout<<getQueueTail(test);
    cout<<endl;
    printQueue(test);
}
