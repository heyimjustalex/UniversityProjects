using CakesWithFactoryMethod.Product;

namespace CakesWithFactoryMethod.Creator
{
    class ChocolateCafe : AbstractCafe
    {
        protected override ICake CreateCake()
        {
            Console.WriteLine($"Returning created ChocolateCake");
            return new ChocolateCake();
        }

        protected override IYoghurt CreateYoghurt()
        {
            Console.WriteLine($"Returning created ChocolateYoghurt");
            return new ChocolateYoghurt();   
        }
    }
}
