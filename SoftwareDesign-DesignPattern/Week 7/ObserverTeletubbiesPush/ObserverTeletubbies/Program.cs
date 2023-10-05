
namespace ObserverTeletubbies
{
    class Program
    {
        static void Main(string[] args) { 
        
            ConcretePhoneSubject subject = new ConcretePhoneSubject();    
            ITeletubbieObserver observer1 = new ConcreteTeletubbieObserver(subject, 1);
            ITeletubbieObserver observer2 = new ConcreteTeletubbieObserver(subject, 2);

            SubjectData data = new SubjectData("UPDATED DATA TEST");
            subject.Data = data;
            

        }
    }
}