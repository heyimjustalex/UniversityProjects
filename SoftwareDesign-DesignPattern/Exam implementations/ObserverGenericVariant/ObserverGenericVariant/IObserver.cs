namespace ObserverGenericVariant
{
    interface IObserver<T>
    {
        public void Update(T data);
    }
}
