
namespace AbstractFactoryDifferentExample.Products
{
    class TabletXiaomi : ITablet
    {
        public void Assemble()
        {
            Console.WriteLine("Assembling Xiaomi Tablet");
        }
    }
}
