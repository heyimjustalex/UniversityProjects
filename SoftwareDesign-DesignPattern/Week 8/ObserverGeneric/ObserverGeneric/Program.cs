using ObserverGeneric.Concrete;

namespace ObserverGeneric
{
    internal class Program
    {
        public static void Main(string[] args) {

            var observer1 = new ConcreteObserver(1);
            var observer2 = new ConcreteObserver(2);

            ConcreteSubjectA subjectA = new ConcreteSubjectA();
            ConcreteSubjectB subjectB = new ConcreteSubjectB();

            subjectA.Attach(observer1);
            subjectA.Attach(observer2);
            subjectB.Attach(observer2); 
            var dataB = new Data.SubjectDataB();
            dataB.Measurement = "stringDataVALUE";

            var dataA = new Data.SubjectDataA();
            dataA.Measurement = 5;
            subjectB.Data = dataB; 
            subjectA.Data = dataA;
        }
        
    }
}