namespace StockObserverGeneric.Data
{
    public class StockData
    {
        string _name;
        double _value;

        public string Name
        {
            get { return _name; }
            set { _name = value; }
        }

        public double Value
        {
            get { return _value; }
            set { _value = value; }
        }

        public StockData(string name, double value)
        {
            _name = name;
            _value = value;
        }
    }
}
