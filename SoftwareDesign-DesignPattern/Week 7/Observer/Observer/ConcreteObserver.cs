
namespace Observer
{
    public class ConcreteObserver :IObserver
    {
        string _id;
        ISubject _subject;
        public ConcreteObserver(string id, ISubject subject) { 
            _subject = subject; 
            
            _id = id;
        }

        public void Update(SubjectData data)
        {
            Console.WriteLine($"Observer:{_id} Data: {data.Data}");
        }
    }
}
