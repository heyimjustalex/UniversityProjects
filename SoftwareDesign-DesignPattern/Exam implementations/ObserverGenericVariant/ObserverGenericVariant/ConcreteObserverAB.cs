namespace ObserverGenericVariant
{
    // Observer is able to implement multiple IObserver interfaces and subscribe to different topics
    // Attach method invokation has to be moved from constructor to different methods to adhere to OCP
    // If we didn't move it we would break OCP cause when adding another type of subjec we would have to 
    // Modify the constructor instead of expanding the class
    class ConcreteObserverAB : IObserver<SubjectDataA>, IObserver<SubjectDataB>
    {
        SubjectDataA _dataA = new SubjectDataA(0);
        SubjectDataB _dataB = new SubjectDataB("0");

        int _id;
        public ConcreteObserverAB(int id)
        {
            _id = id;

        }
        // There must be different subscribtion for each of the concrete subjects
        public void subscribeToSubject(ConcreteSubjectA subject)
        {
            subject.Attach(this);
        }
        public void subscribeToSubject(ConcreteSubjectB subject)
        {
            subject.Attach(this);
        }

        public void Update(SubjectDataA data)
        {
            _dataA = data;
            Console.WriteLine("Data (SubjectDataA) has been changed for observer " + _id.ToString() + " -> " + _dataA.Measurement.ToString());
        }

        public void Update(SubjectDataB data)
        {

            _dataB = data;
            Console.WriteLine("Data (SubjectDataB) has been changed for observer " + _id.ToString() + " -> " + _dataB.Measurement.ToString());
        }
    }
}
