
namespace AbstractFactoryDifferentExample.Products
{
    class PhoneApple : IPhone
    {
        public void Assemble()
        {
            Console.WriteLine("Assembling Apple Phone");
        }
    }
}
