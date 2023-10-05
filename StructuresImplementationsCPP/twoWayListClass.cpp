#include <iostream>

struct node
{
    node* m_next = nullptr;
    node* m_prev = nullptr;
    int m_data = 0;

};

class twoWayList
{
    node* m_head = nullptr;
    node* m_tail = nullptr;
    int m_noOfEl= 0;
public:

    int getNumberOfEl();
    void add_front_el(int data);
    void add_back_el(int data);
    void add_pos_el(int data, int pos);
    int pop_front_el();
    int pop_back_el();
    int pop_pos_el(int pos);
    void printFront();
    void printBack();
    void popAll();


};

int twoWayList::getNumberOfEl()
{
    return m_noOfEl;
}

void twoWayList::add_front_el(int data)
{
    node* new_el = new node;
    new_el->m_data = data;

    if(m_head!=nullptr)
    {
        new_el -> m_next = m_head;
        m_head->m_prev = new_el;
    }
    m_head = new_el;

    if(m_tail==nullptr)
    {
        m_tail = new_el;
    }

    ++m_noOfEl;
}

void twoWayList::add_back_el(int data)
{
    node* new_el = new node;
    new_el->m_data = data;

    if(m_tail !=nullptr)
    {
        m_tail->m_next = new_el;
        new_el->m_prev= m_tail;
    }

    m_tail= new_el;

    if(m_head==nullptr)
    {
        m_head = new_el;
    }

    ++m_noOfEl;
}

void twoWayList::add_pos_el(int data, int pos)
{
    node* new_el = new node;
    node* temp=m_head;

    new_el->m_data = data;

    if(pos==0)
    {
        add_front_el(data);
    }
    else if(pos==m_noOfEl)
    {
        add_back_el(data);
    }
    else if(pos<0 || pos>m_noOfEl)
    {
        return;
    }
    else
    {
        for(int i=0; i<pos-1; i++)
        {
            temp=temp->m_next;
        }

        new_el->m_prev = temp;
        new_el->m_next = temp->m_next;
        temp->m_next->m_prev = new_el;
        temp->m_next=new_el;

        ++m_noOfEl;
    }
}

int twoWayList::pop_front_el()
{
    node* temp = m_head;
    int val;

    if(m_noOfEl==0)
    {
        std::cout<<"no elements to pop";
        return -1;
    }

    else if(m_noOfEl==1)
    {
        val = m_head->m_data;
        delete m_head;
        m_head=nullptr;
        m_tail=nullptr;
    }
    else
    {
        val = m_head->m_data;
        m_head->m_next->m_prev=nullptr;
        m_head=m_head->m_next;
        delete temp;
    }
    --m_noOfEl;

    return val;
}

int twoWayList::pop_back_el()
{
    node* temp = m_tail;
    int val;

    if(m_noOfEl==0)
    {
        std::cout<<"no elements to pop";
        return -1;
    }

    else if(m_noOfEl==1)
    {
        val = m_tail->m_data;
        delete m_head;
        m_head=nullptr;
        m_tail=nullptr;
    }
    else
    {
        val = m_tail->m_data;
        m_tail->m_prev->m_next=nullptr;
        m_tail=m_tail->m_prev;
        delete temp;
    }
    --m_noOfEl;

    return val;
}

int twoWayList::pop_pos_el(int pos)
{

    node* temp=m_head;
    node* temp2;
    int val;

    if(pos==0)
    {
        val = pop_front_el();
    }
    else if(pos==m_noOfEl)
    {
        val = pop_back_el();
    }
    else if(pos<0 || pos>m_noOfEl)
    {
        std::cout<<"invalid position"<<std::endl;
        return -1;
    }
    else
    {
        for(int i=0; i<pos-1; i++)
        {
            temp=temp->m_next;
        }

        temp2=temp->m_next;
        val = temp2->m_data;
        temp->m_next->m_next->m_prev=temp;
        temp->m_next=temp->m_next->m_next;

        --m_noOfEl;
    }
    return val;

}

void twoWayList::printFront()
{
    node* temp = m_head;
    for(int i=0; i<m_noOfEl; i++)
    {
        std::cout<<temp->m_data<<" ";
        temp = temp->m_next;
    }
}

void twoWayList::printBack()
{
    node* temp = m_tail;
    for(int i=0; i<m_noOfEl; i++)
    {
        std::cout<<temp->m_data<<" ";
        temp = temp->m_prev;
    }
}

void twoWayList::popAll()
{
    while(m_head!=nullptr)
    {
        pop_front_el();
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
            test.add_front_el(data);
            break;

        case 2:
            std::cout<<"give data:\n";
            std::cin>>data;
            test.add_back_el(data);
            break;

        case 3:
            std::cout<<"give data:\n";
            std::cin>>data;
            std::cout<<"give position:\n";
            std::cin>>pos;
            test.add_pos_el(data,pos);
            break;

        case 4:
            fflush(stdin);
            std::cout<<"front popped element: "<<test.pop_front_el()<<std::endl;
            getchar();
            break;
        case 5:
            fflush(stdin);
            std::cout<<"last popped element: "<<test.pop_back_el()<<std::endl;
            getchar();
            break;
        case 6:
            fflush(stdin);
            std::cout<<"give position:\n";
            std::cin>>pos;
            std::cout<<test.pop_pos_el(pos);
            getchar();

            break;
        case 7:
            test.popAll();
            break;

        case 8:
            fflush(stdin);
            test.printFront();
            std::cout<<std::endl;
            test.printBack();
            getchar();
            break;

        case 9:
            fflush(stdin);
            std::cout<<test.getNumberOfEl()<<std::endl;
            getchar();
            break;
        default:
            return 0;

        }
        system("cls");
    }
}
