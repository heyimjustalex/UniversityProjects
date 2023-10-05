namespace ObserverGenericVariant
{
    class Program
    {
        static void Main(string[] args)
        {

           ConcreteSubjectA subject1 = new ConcreteSubjectA();
           ConcreteSubjectB subject2 = new ConcreteSubjectB();

           ConcreteObserverAB observer1 = new ConcreteObserverAB(22);

           observer1.subscribeToSubject(subject1);
           observer1.subscribeToSubject(subject2);


           subject1.Data = new SubjectDataA(5);
           subject2.Data = new SubjectDataB("66");

          

        }
    }
}