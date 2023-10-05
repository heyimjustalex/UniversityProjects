
namespace ObserverTeletubbies
{
    internal class ConcretePhoneSubject : IPhoneSubject
    {
        List<ITeletubbieObserver> _observers;
        SubjectData _data;
        public SubjectData Data
        {
            get
            {
                return _data;
            }
            set
            {
                _data = value;
                NotifyAll();
            }
        }

        public SubjectData getSubjectState()
        {
            return _data;
        }

        public ConcretePhoneSubject() {

            _observers = new List<ITeletubbieObserver> ();
            _data = new SubjectData("init");
      
        }
        public void Attach(ITeletubbieObserver observer)
        {
            _observers.Add (observer);
        }

        public void Detach(ITeletubbieObserver observer)
        {
           _observers?.Remove (observer);
        }

        public void NotifyAll()
        { 
            foreach (ITeletubbieObserver observer in _observers) {

                observer.Update();
            }
        }
    }
}
