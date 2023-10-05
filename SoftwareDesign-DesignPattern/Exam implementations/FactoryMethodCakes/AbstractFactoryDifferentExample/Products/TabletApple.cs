
namespace AbstractFactoryDifferentExample.Products
{
    class TabletApple : ITablet
    {
        public void Assemble()
        {
            Console.WriteLine("Assembling Apple Tablet");
        }
    }
}
