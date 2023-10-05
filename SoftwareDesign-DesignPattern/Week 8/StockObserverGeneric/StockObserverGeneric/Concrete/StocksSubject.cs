using StockObserverGeneric.Data;
using StockObserverGeneric.Generic;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StockObserverGeneric.Concrete
{
    public class StocksSubject: ISubjectGeneric<StockData>
    {
        List<IObserverGeneric<StockData>> observers;
        StockData _data;
    public StockData Data
    {
        get
        {
            return _data;
        }
        set
        {
            _data = value;
            Notify();
        }
    }
    public StocksSubject()
    {
        _data = new StockData();
        observers = new List<IObserverGeneric<StockData>>();
    }
    public void Attach(IObserverGeneric<StockData> observer)
    {
        observers.Add(observer);
    }

    public void Detach(IObserverGeneric<StockData> observer)
    {
        observers.Remove(observer);
    }

    public void Notify()
    {
        foreach (var observer in observers)
        {

            observer.Update(_data);
        }
    }
}
}
