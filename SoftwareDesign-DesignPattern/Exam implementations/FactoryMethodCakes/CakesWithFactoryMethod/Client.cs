

using CakesWithFactoryMethod.Creator;
using CakesWithFactoryMethod.Product;

namespace CakesWithFactoryMethod
{
    class Client
    {
        public static void Main(string[] args)
        {
           VanillaCakeCafe vanillaCakeCafe = new VanillaCakeCafe();

            ChocolateCakeCafe chocolateCakeCafe = new ChocolateCakeCafe();  
           ICake vanillaCake =  vanillaCakeCafe.OrderCake();
            ICake chocolateCake = chocolateCakeCafe.OrderCake();

        }
    }
}
