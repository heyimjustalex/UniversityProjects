
using StockObserverGeneric.Data;

namespace StockObserverGeneric
{
    public class Portfolio
    {
        public int _id;
        public List<StockData> _stockData { get; set; }  
        public Portfolio(int id) { 
            _id = id;   
            _stockData = new List<StockData>();  
       
        }
    }
}
