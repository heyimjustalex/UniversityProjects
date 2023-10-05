using AbstractFactoryDifferentExample.Products;

namespace AbstractFactoryDifferentExample.Factories
{
    interface IAbstractDeviceFactory
    {
        public IMonitor CreateMonitor();
        public IPhone CreatePhone();
        public ITablet CreateTablet();
    }
}

