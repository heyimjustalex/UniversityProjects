using AbstractFactoryDifferentExample.Products;

namespace AbstractFactoryDifferentExample.Factories
{
    public class XiaomiDeviceFactory : IAbstractDeviceFactory
    {
        IMonitor IAbstractDeviceFactory.CreateMonitor()
        {
            return new MonitorXiaomi();
        }

        IPhone IAbstractDeviceFactory.CreatePhone()
        {
            return new PhoneXiaomi();
        }

        ITablet IAbstractDeviceFactory.CreateTablet()
        {
            return new TabletXiaomi();
        }
    }
}
