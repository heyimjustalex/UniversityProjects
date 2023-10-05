
using ObserverGeneric.Data;
using ObserverGeneric.Generic;

namespace ObserverGeneric.Concrete
{
    public class ConcreteSubjectA : ISubjectGeneric<SubjectDataA>
    {
        List<IObserverGeneric<SubjectDataA>> observers;
        SubjectDataA _data;
        public SubjectDataA Data
        {
            get
            {
                return _data;
            }
            set
            {
                _data = value;
                Notify();
            }
        }


        public ConcreteSubjectA()
        {
            _data = new SubjectDataA();
            observers = new List<IObserverGeneric<SubjectDataA>>();
        }
        public void Attach(IObserverGeneric<SubjectDataA> observer)
        {
            observers.Add(observer);
        }

        public void Detach(IObserverGeneric<SubjectDataA> observer)
        {
            observers.Remove(observer);
        }

        public void Notify()
        {
            foreach (var observer in observers)
            {

                observer.Update(_data);
            }
        }
    }
}
