
namespace ObserverPullVariant
{
    class Program
    {
        static void Main(string[] args) {

            ConcreteSubject subject1 = new ConcreteSubject();
            ConcreteSubject subject2 = new ConcreteSubject();

            IObserver observer1 = new ConcreteObserver(subject1,11);

            IObserver observer2 = new ConcreteObserver(subject1, 22);

            subject1.Data = new SubjectData(5);

            subject1.Data = new SubjectData(6);

        }
    }
}