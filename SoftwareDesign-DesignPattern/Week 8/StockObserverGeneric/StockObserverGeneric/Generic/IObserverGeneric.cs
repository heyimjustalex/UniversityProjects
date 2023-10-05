using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StockObserverGeneric.Generic
{
    public interface IObserverGeneric<T>
    {
        public void Update(T data);

    }
}
