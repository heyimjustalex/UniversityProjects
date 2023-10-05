#include <iostream>

struct node
{
    int m_data;
    node* m_next=nullptr;
    node* m_prev=nullptr;
};

struct twoWayList
{
    node* m_head=nullptr;
    node* m_tail=nullptr;
    int m_noOfEl=0;
};

void push_front_el(twoWayList &l, int data)
{
    node* new_el = new node;
    new_el->m_data=data;
    new_el->m_prev=nullptr;

    if(l.m_head!=nullptr)
    {
        l.m_head->m_prev=new_el;
        new_el->m_next=l.m_head;
    }

    l.m_head=new_el;

    if(l.m_tail==nullptr)
    {
        l.m_tail=new_el;
    }
    ++l.m_noOfEl;
}

void push_back_el(twoWayList &l, int data)
{
    node* new_el = new node;
    new_el->m_data = data;
    new_el->m_next = nullptr;

    if(l.m_tail!=nullptr)
    {
        l.m_tail->m_next=new_el;
        new_el->m_prev=l.m_tail;
    }

    l.m_tail = new_el;

    if(l.m_head==nullptr)
    {
        l.m_head = new_el;
    }

    ++l.m_noOfEl;
}

void push_pos_el(twoWayList &l,int pos, int data)
{
    node* temp= l.m_head;
    node* new_el = new node;
    new_el->m_data=data;

    if(pos>l.m_noOfEl)
    {
        std::cout<<"wrong position number\n";
        return;
    }
    else if(pos==0)
    {
        push_front_el(l,data);
    }
    else if(pos==l.m_noOfEl)
    {
        push_back_el(l,data);
    }
    else
    {
        for(int i=0;i<pos-1;i++)
        {
            temp = temp->m_next;
        }
        temp->m_next->m_prev=new_el;
        new_el->m_next=temp->m_next;
        new_el->m_prev=temp;
        temp->m_next=new_el;
        ++l.m_noOfEl;

    }
}

int pop_front_element(twoWayList &l)
{
    node *temp;
    int val;
    if(l.m_noOfEl==0)
    {
        std::cout<<"no elements in list\n";
        return -1;
    }
    else if(l.m_noOfEl==1)
    {
        val=l.m_head->m_data;
        delete l.m_head;
        l.m_head=nullptr;
        l.m_tail=nullptr;
    }
    else
    {
        val=l.m_head->m_data;
        temp=l.m_head;
        l.m_head->m_next->m_prev=nullptr;
        l.m_head=l.m_head->m_next;
        delete temp;
    }
    --l.m_noOfEl;

    return val;
}

int pop_last_element(twoWayList &l)
{
    node *temp;
    int val;
    if(l.m_noOfEl==0)
    {
        std::cout<<"no elements in list\n";
        return -1;
    }
    else if(l.m_noOfEl==1)
    {
        val=l.m_tail->m_data;
        delete l.m_head;
        l.m_head=nullptr;
        l.m_tail=nullptr;
    }
    else
    {
        val=l.m_tail->m_data;
        temp=l.m_tail;
        l.m_tail->m_prev->m_next=nullptr;
        l.m_tail=l.m_tail->m_prev;
        delete temp;
    }
    --l.m_noOfEl;
    return val;
}

int pop_pos_element(twoWayList &l, int pos)
{
    node* temp = l.m_head;
    node* temp2 = l.m_head;
    int val;
    if(pos==0)
    {
        val = pop_front_element(l);
    }
    else if(pos==l.m_noOfEl-1)
    {
        val = pop_last_element(l);
    }
    else if(pos>=l.m_noOfEl || pos<0)
    {
         std::cout<<"wrong pos\n";
         return -1;
    }
    else
    {
        for(int i=0;i<pos-1;i++)
        {
            temp=temp->m_next;
        }

        temp2=temp->m_next;
        val = temp2->m_data;
        temp->m_next->m_next->m_prev=temp;
        temp->m_next=temp->m_next->m_next;
        delete temp2;

        --l.m_noOfEl;

    }
    return val;
}

void printFromBeginning(const twoWayList &l)
{
    node *temp = l.m_head;
    for(int i=0;i<l.m_noOfEl;i++)
    {
        std::cout<<temp->m_data<<" ";
        temp=temp->m_next;
    }
}

void printFromEnd(const twoWayList &l)
{
    node *temp = l.m_tail;
    for(int i=0;i<l.m_noOfEl;i++)
    {
        std::cout<<temp->m_data<<" ";
        temp=temp->m_prev;
    }
}

void popAll(twoWayList &l)
{
    while(l.m_head!=nullptr)
    {
        pop_front_element(l);
    }
}

int main()
{
    twoWayList test;
    int val,data,pos;

    while(val!=0)
    {
        std::cout<<" 1. front list add\n 2. back list add \n 3. position (position indexed from 0) add \n 4. pop front \n 5. pop last\n 6. delete pos\n 7. clear_all \n 8. print_list \n 9. how_many_elements \n 0. EXIT \n";
        std::cin>>val;

        switch(val)
        {
            case 1:
            std::cout<<"give data:\n";
            std::cin>>data;
            push_front_el(test,data);
            break;

            case 2:
            std::cout<<"give data:\n";
            std::cin>>data;
            push_back_el(test,data);
            break;

            case 3:
            std::cout<<"give data:\n";
            std::cin>>data;
            std::cout<<"give position:\n";
            std::cin>>pos;
            push_pos_el(test,pos,data);
            break;

            case 4:
                fflush(stdin);
                std::cout<<"front popped element: "<<std::endl;
                std::cout<<pop_front_element(test);
                getchar();
                break;
            case 5:
                fflush(stdin);
                std::cout<<"last popped element: "<<std::endl;
                std::cout<<pop_last_element(test);
                getchar();
                break;
            case 6:
                fflush(stdin);
                std::cout<<"give position:\n";
                std::cin>>pos;
                std::cout<<pop_pos_element(test,pos);
                getchar();

                break;
            case 7:
               popAll(test);
                break;

            case 8:
                fflush(stdin);
                printFromBeginning(test);
                std::cout<<std::endl;
                printFromEnd(test);
                getchar();
                break;

            case 9:
                fflush(stdin);
                std::cout<<test.m_noOfEl;
                getchar();
                break;
            default:
                return 0;

        }
        system("cls");
    }

}
