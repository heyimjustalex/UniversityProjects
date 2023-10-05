
namespace ObserverPullVariant
{
    class ConcreteObserver : IObserver
    {
        // we are forced to use concrete subject type, because ISubject doesn't have getter or getData method
        ConcreteSubject subject;
        SubjectData data ;
        int _id;
        public ConcreteObserver(ConcreteSubject subject, int id)
        {
            _id = id;   
            this.subject = subject; 
            subject.Attach(this);
            this.data = subject.Data;
        }
        public void Update()
        {
            //Pull data from the subject
            data = subject.Data;

            Console.WriteLine("Data has been changed for observer "+_id.ToString()+" -> "+data.Measurement.ToString());
            
        }
    }
}
