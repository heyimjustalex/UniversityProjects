using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Observer
{
    internal class ConcerteSubject : ISubject
    {
        List<IObserver> _observers;

        SubjectData _state;
        public SubjectData State
        {
            get
            {
                return _state;
            } 
            set
            {
                _state = value;
                NotifyAll();
            }
        }

        public ConcerteSubject()
        {
            _observers = new List<IObserver>(); 
            _state = new SubjectData("init");
   
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
            foreach (IObserver observer in _observers) {
                observer.Update(State);
            }
        }
    }
}
