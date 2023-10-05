using ObserverGeneric.Data;
using ObserverGeneric.Generic;

namespace ObserverGeneric.Concrete
{
    public class ConcreteSubjectB : ISubjectGeneric<SubjectDataB>
    {
        List<IObserverGeneric<SubjectDataB>> observers;

        SubjectDataB _data;
        public SubjectDataB Data
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
        public ConcreteSubjectB()
        {
            _data = new SubjectDataB();
            observers = new List<IObserverGeneric<SubjectDataB>>();
        }
        public void Attach(IObserverGeneric<SubjectDataB> observer)
        {
            observers.Add(observer);
        }

        public void Detach(IObserverGeneric<SubjectDataB> observer)
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
