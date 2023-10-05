using AbstractFactoryDifferentExample.Factories;
using AbstractFactoryDifferentExample.Products;

namespace AbstractFactoryDifferentExample
{
    class Client
    {
        private IPhone _phone;
        private ITablet _tablet;
        private IMonitor _monitor;   

        public Client(IAbstractDeviceFactory factory) 
        { 
            _monitor = factory.CreateMonitor();  
            _phone = factory.CreatePhone(); 
            _tablet = factory.CreateTablet();
        }

        public void AssembleDevices()
        {
            _monitor.Assemble();
            _phone.Assemble();  
            _tablet.Assemble(); 
        }

        
    }
}