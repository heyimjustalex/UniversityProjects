namespace ObserverPushVariant
{
    class ConcreteSubject:ISubject
    {
        List<IObserver> _observers;

        SubjectData _data;

        public SubjectData Data
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
        public ConcreteSubject()
        {

            _data = new SubjectData(0);
            _observers = new List<IObserver>();
        }

        public void Attach(IObserver observer)
        {
          _observers.Add(observer);
        }

        public void Detach(IObserver observer)
        {
           _observers.Remove(observer); 
        }

        public void NotifyAll()
        {
            // We "Push" data to the observer (we pass data as parameter from Subject to Observer)
            foreach(IObserver observer in _observers) {
                observer.Update(_data);
            }
        }
    }
}
