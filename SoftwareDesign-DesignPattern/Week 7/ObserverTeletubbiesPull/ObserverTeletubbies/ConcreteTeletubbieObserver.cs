
namespace ObserverTeletubbies
{
    internal class ConcreteTeletubbieObserver : ITeletubbieObserver
    {
        ConcretePhoneSubject _subject;
        int _id;
        SubjectData _data;

        public ConcreteTeletubbieObserver(ConcretePhoneSubject subject, int id) {
            _id = id;
            _subject = subject;
            _subject.Attach(this);
        }    
        public void Update()
        {           
            _data = _subject.getSubjectState();            
            Console.WriteLine($"Observer:{_id} DATA -> {_data.Data} ");
        }
    }
}
