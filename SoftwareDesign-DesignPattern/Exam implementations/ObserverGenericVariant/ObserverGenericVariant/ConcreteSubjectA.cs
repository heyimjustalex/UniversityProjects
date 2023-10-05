namespace ObserverGenericVariant
{
    // the subject is for concrete ISubject implementation dependant on SubjectData T
    class ConcreteSubjectA : ISubject<SubjectDataA>
    {
        List<IObserver<SubjectDataA>> _observers = new List<IObserver<SubjectDataA>>();
        SubjectDataA _data = new SubjectDataA(0);
        public SubjectDataA Data
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
        public void Attach(IObserver<SubjectDataA> observer)
        {
            _observers.Add(observer);
        }

        public void Detach(IObserver<SubjectDataA> observer)
        {
            _observers.Remove(observer);
        }

        public void NotifyAll()
        {
            foreach (IObserver<SubjectDataA> observer in _observers)
            {
                observer.Update(_data);
            }
        }
    }
}
