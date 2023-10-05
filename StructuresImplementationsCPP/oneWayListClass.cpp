#include <iostream>

struct node
{
    int m_data;
    node* m_next = nullptr;
};

class listSt
{
    node* m_head = nullptr;
    node* m_tail = nullptr;
    int m_noOfEl = 0;

public:

    void add_front_el(int data);
    void add_back_el(int data);
    void add_pos_el(int data, int position);

    void pop_pos_el(int position);
    int popFront();
    int popLast();
    void dealloc();

    void print();
    int get_no_of_ele() const;

};

int listSt::get_no_of_ele() const
{
    return m_noOfEl;
}

void listSt::add_front_el(int data)
{
    node* new_el = new node;
    new_el->m_data=data;
    new_el->m_next=m_head;
    m_head=new_el;

    if(m_tail==nullptr)
    {
        m_tail=new_el;
    }
    ++m_noOfEl;
}

void listSt::add_back_el(int data)
{
    node* new_el = new node;
    new_el->m_data = data;

    if(m_tail!=nullptr)
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

void listSt::add_pos_el(int data, int position)
{
    node* temp = m_head;
    node* new_el= new node;
    new_el->m_data=data;
    if(position==0)
    {
        this->add_front_el(data);
    }
    else if(position==m_noOfEl)
    {
        this->add_back_el(data);
    }
    else if(position>m_noOfEl)
    {
        return;
    }
    else
    {
        for(int i=0;i<position-1;i++)
        {
            temp=temp->m_next;
        }

        new_el->m_next=temp->m_next;
        temp->m_next=new_el;
         ++m_noOfEl;
    }

}

void listSt::print()
{
    node* temp = m_head;
    while(temp!=nullptr)
    {
        std::cout<<temp->m_data<<" ";
        temp=temp->m_next;
    }
}

int listSt::popFront()
{
    node* temp=m_head;
    int val=m_head->m_data;
    if(m_noOfEl==0)
    {
        std::cout<<"List is empty"<<std::endl;
        return -1;
    }
    else if(m_noOfEl==1)
    {
        m_tail=nullptr;
    }

    m_head=m_head->m_next;
    delete temp;
    --m_noOfEl;

    return val;
}

int listSt::popLast()
{
    node* temp=m_head;
    if(m_noOfEl<=0){}

    else if(m_noOfEl==1)
    {
        delete temp;
        m_head=nullptr;
        m_tail=nullptr;
    }
    else
    {
        for(int i=0; i<m_noOfEl-2; i++)
        {
            temp=temp->m_next;
        }

        delete m_tail;
        temp->m_next=nullptr;
        m_tail=temp;

    }
    m_noOfEl--;
}

void listSt::pop_pos_el(int position)
{
    node* temp = m_head;
    node* temp_to_del;

    if(position==0)
    {
        this->popFront();
    }
    else if(position==m_noOfEl)
    {
        this->popLast();
    }
    else if(position>m_noOfEl)
    {
        return;
    }
    else
    {
        for(int i=0;i<position-1;i++)
        {
            temp=temp->m_next;
        }
        temp_to_del=temp->m_next;
        temp->m_next=temp->m_next->m_next;

        --m_noOfEl;
    }

}
void listSt::dealloc()
{
    int temp=m_noOfEl;
    while(temp>0)
    {
       popFront();
       temp--;
    }
}

int main()
{
    listSt test;
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
                std::cout<<"front popped element: "<<test.popFront()<<std::endl;
                break;
            case 5:
                std::cout<<"last popped element: "<<test.popLast()<<std::endl;
                break;
            case 6:
                std::cout<<"give position:\n";
                std::cin>>pos;
                test.pop_pos_el(pos);

                break;
            case 7:
                test.dealloc();
                break;

            case 8:
                fflush(stdin);
                test.print();
                getchar();
                break;

            case 9:
                fflush(stdin);
                std::cout<<test.get_no_of_ele()<<std::endl;
                getchar();
                break;
            default:
                return 0;

        }
        system("cls");
    }

}
