
namespace AbstractFactoryDifferentExample.Products
{
    class PhoneXiaomi : IPhone
    {
        public void Assemble()
        {
            Console.WriteLine("Assembling Xiaomi Phone");
        }
    }
}
