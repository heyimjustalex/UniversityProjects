namespace Observer
{
    public class Program
    {
        public static void Main(string[] args) {

            var subject1 = new ConcerteSubject();


            var observer1 = new ConcreteObserver("Observer 1",subject1);
            var observer2 = new ConcreteObserver("Observer 2", subject1 );

            subject1.Attach(observer1);
            subject1.Attach(observer2);

            SubjectData updatedSubjectData = new SubjectData("NEW DATA");

            subject1.State = updatedSubjectData; 

          



        }
    }
}