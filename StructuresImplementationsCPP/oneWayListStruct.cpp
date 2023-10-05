#include <iostream>

using namespace std;

struct node
{
    int m_data=0;
    node* m_next=nullptr;
};

struct singleList
{
    node* m_head=nullptr;
    node* m_tail=nullptr;
    int m_noOfElements=0;
};

void add_front_el(singleList &l, int data)
{
    node* new_el=new node;
    new_el->m_data=data;

    if(l.m_tail==nullptr)
    {
        l.m_tail=new_el;
    }
    new_el->m_next=l.m_head;
    l.m_head=new_el;
    ++l.m_noOfElements;

}

void add_back_el(singleList &l, int data)
{
    node *new_el = new node;
    new_el->m_data=data;

    if(l.m_head!=nullptr)
    {
        l.m_tail->m_next=new_el;
    }

    l.m_tail=new_el;

    if(l.m_head==nullptr)
    {
        l.m_head = new_el;
    }
    ++l.m_noOfElements;
}

void add_pos(singleList &l, int data, int pos)
{
    node *new_el = new node;
    new_el->m_data=data;

    if(pos>l.m_noOfElements)
    {
        cout<<"Incorrect position"<<endl;
        return;
    }
    node* temp=l.m_head;

    if(pos==0)
    {
        add_front_el(l,data);
    }

    else if(pos==l.m_noOfElements-1)
    {
        add_back_el(l,data);
    }


    for(int i=0; i<pos-1; i++)
    {
        temp=temp->m_next;
    }

    new_el->m_next=temp->m_next;
    temp->m_next=new_el;
    ++l.m_noOfElements;


}

void printList(const singleList &l)
{
    node *temp= l.m_head;
    while(temp!=nullptr)
    {
        cout<<temp->m_data<<" ";
        temp=temp->m_next;
    }
}

void delete_first_el(singleList &l)
{
    node *temp = l.m_head;

    if(l.m_noOfElements==1)
    {
        l.m_tail=nullptr;
        l.m_head=nullptr;
        delete temp;
        return;

    }
    l.m_head=l.m_head->m_next;

    delete temp;

    --l.m_noOfElements;

}

void delete_last_el(singleList &l)
{
    node *temp = l.m_tail;
    node *tempTail;
    if(l.m_noOfElements==0)
    {
        cout<<"No elements to delete\n";
        return;
    }
    else if(l.m_noOfElements==1)
    {
        l.m_head=nullptr;
        l.m_tail=nullptr;
        delete temp;
        return;

    }
    else
    {
        temp=l.m_head;
        tempTail=l.m_tail;
        for(int i=0; i<l.m_noOfElements-2;i++)
        {
            temp=temp->m_next;

        }
        l.m_tail=temp;
        l.m_tail->m_next=nullptr;
        delete tempTail;

    }
    --l.m_noOfElements;

}

void delete_pos_el(singleList &l, int pos)
{
    node *temp = l.m_head;
    node *temp2;

    if(pos==0)
    {
        delete_first_el(l);
    }
    else if(pos==l.m_noOfElements-1)
    {
        delete_last_el(l);
    }
    else if(pos>=l.m_noOfElements)
    {
        return;
    }
    else
    {
        for(int i=0;i<pos-1;i++)
        {
            temp=temp->m_next;
        }
        temp2=temp;
        temp->m_next=temp->m_next->m_next;
        delete temp2;

    }
}

int main()
{
    singleList test;

    add_front_el(test,0);
    add_front_el(test,1);
    add_front_el(test,2);
    add_back_el(test,3);
    add_back_el(test,4);
    add_pos(test,5,1);

    printList(test);
    delete_first_el(test);
    delete_first_el(test);
    delete_first_el(test);


    cout<<endl;
    printList(test);

    add_front_el(test,6);
    add_front_el(test,7);
    add_front_el(test,8);
    add_back_el(test,9);

    cout<<endl;
    printList(test);
    delete_last_el(test);
    cout<<endl<<endl;
    printList(test);
    cout<<endl;
    delete_pos_el(test,test.m_noOfElements-1);
    printList(test);
    cout<<endl;
    add_pos(test,9,1);
    printList(test);
    // printList(test);
}
