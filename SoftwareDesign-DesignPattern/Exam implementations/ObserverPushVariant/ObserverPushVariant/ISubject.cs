
namespace ObserverPushVariant
{
    interface ISubject
    {
        void Attach(IObserver observer);
        void Detach(IObserver observer);
        void NotifyAll();
    }
}
