
namespace ObserverTeletubbies
{
    internal class ConcreteTeletubbieObserver : ITeletubbieObserver
    {
        IPhoneSubject _subject;
        int _id;
     

        public ConcreteTeletubbieObserver(IPhoneSubject subject, int id) {
            _id = id;
            _subject = subject;
            _subject.Attach(this);
        }    
        public void Update(SubjectData data)
        {
           
           
            Console.WriteLine($"Observer:{_id} DATA -> {data.Data} ");
        }
    }
}
