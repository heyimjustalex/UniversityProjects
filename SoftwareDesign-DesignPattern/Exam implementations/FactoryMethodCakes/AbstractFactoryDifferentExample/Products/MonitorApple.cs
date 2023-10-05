
namespace AbstractFactoryDifferentExample.Products
{
    class MonitorApple : IMonitor
    {
        public void Assemble()
        {
            Console.WriteLine("Assembling Apple Monitor");
        }
    }
}
