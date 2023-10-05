namespace ObserverGenericVariant
{
    class ConcreteSubjectB : ISubject<SubjectDataB>
    {
        List<IObserver<SubjectDataB>> _observers = new List<IObserver<SubjectDataB>>();
        SubjectDataB _data = new SubjectDataB("0");
        public SubjectDataB Data
        {
            get
            {
                return _data;
            }
            set
            {
                // after setting new data we notify all of the subscribers
                _data = value;
                NotifyAll();
            }
        }
        public void Attach(IObserver<SubjectDataB> observer)
        {
            _observers.Add(observer);
        }

        public void Detach(IObserver<SubjectDataB> observer)
        {
            _observers.Remove(observer);
        }

        public void NotifyAll()
        {
            foreach (IObserver<SubjectDataB> observer in _observers)
            {
                observer.Update(_data);
            }
        }
    }
}
