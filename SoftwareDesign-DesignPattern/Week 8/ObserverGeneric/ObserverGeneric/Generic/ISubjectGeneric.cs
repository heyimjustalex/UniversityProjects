namespace ObserverGeneric.Generic
{
    public interface ISubjectGeneric<T>
    {
        public void Attach(IObserverGeneric<T> observer);
        public void Detach(IObserverGeneric<T> observer);
        public void Notify();
    }
}
