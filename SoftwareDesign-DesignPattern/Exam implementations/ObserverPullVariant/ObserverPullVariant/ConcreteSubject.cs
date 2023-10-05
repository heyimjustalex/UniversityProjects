
namespace ObserverPullVariant
{
    class ConcreteSubject : ISubject
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
        public ConcreteSubject() {
            
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
            foreach(IObserver observer in _observers)
            {
                // we invoke update and observer pulls data with Data getter
                observer.Update();
            }
        }
    }
}
