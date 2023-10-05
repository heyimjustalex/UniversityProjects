using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StockObserverGeneric.Generic
{
    public interface ISubjectGeneric<T>
    {
        public void Attach(IObserverGeneric<T> observer);
        public void Detach(IObserverGeneric<T> observer);

        public void Notify();

    }
}
