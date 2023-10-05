

namespace ObserverPushVariant
{
    
    class ConcreteObserver : IObserver
    {
        SubjectData _data;

        int _id;
        
        public ConcreteObserver(ISubject subject, int id)
        {
            subject.Attach(this);
            _id=id; 
        }
        public void Update(SubjectData data)
        {
            _data = data;
            Console.WriteLine("Data has been changed for observer PUSH " + _id.ToString() + " -> " + _data.Measurement.ToString());
           
            
        }
    }
}
