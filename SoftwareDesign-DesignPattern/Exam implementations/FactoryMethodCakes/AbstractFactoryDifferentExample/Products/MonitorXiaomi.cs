
namespace AbstractFactoryDifferentExample.Products
{
    class MonitorXiaomi : IMonitor
    {
        public void Assemble()
        {
            Console.WriteLine("Assembling Xiaomi Monitor");
        }
    }
}
