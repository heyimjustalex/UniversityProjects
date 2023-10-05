using AbstractFactoryDifferentExample.Products;

namespace AbstractFactoryDifferentExample.Factories
{
    public class AppleDeviceFactory : IAbstractDeviceFactory
    {
        IMonitor IAbstractDeviceFactory.CreateMonitor()
        {
            return new MonitorApple();
        }

        IPhone IAbstractDeviceFactory.CreatePhone()
        {
            return new PhoneApple();
        }

        ITablet IAbstractDeviceFactory.CreateTablet()
        {
            return new TabletApple();
        }
    }
}
