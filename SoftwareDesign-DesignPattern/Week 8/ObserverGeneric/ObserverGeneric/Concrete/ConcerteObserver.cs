
using ObserverGeneric.Data;
using ObserverGeneric.Generic;

namespace ObserverGeneric.Concrete
{
    public class ConcreteObserver : IObserverGeneric<SubjectDataA>, IObserverGeneric<SubjectDataB>
    {
        int _id;
        ISubjectGeneric<SubjectDataA> subject1;
        SubjectDataA _dataA;
        SubjectDataB _dataB;

       public ConcreteObserver(int id)
        {
            _id = id;
            _dataA = new SubjectDataA(); 
            _dataB = new SubjectDataB(); 
            subject1.
        }
        public void Update(SubjectDataA data)
        {
            Console.WriteLine($"Observer {_id}: Updating subjectdataA value: {data.Measurement}");
            _dataA = data;
           
        }

        public void Update(SubjectDataB data)
        {
            Console.WriteLine($"Observer {_id}: Updating subjectdataB value: {data.Measurement} ");
            _dataB = data;
        }
    }
}
