

using AbstractFactoryDifferentExample.Factories;

namespace AbstractFactoryDifferentExample
{
    public class Program
    {
        public static void Main(string[] args) {

            IAbstractDeviceFactory factoryXiaomi = new XiaomiDeviceFactory();
            IAbstractDeviceFactory factoryApple = new AppleDeviceFactory();

            Client client1 = new Client(factoryXiaomi);
            client1.AssembleDevices();

            Client client2 = new Client(factoryApple);
            client2.AssembleDevices();


        }
    }
}
