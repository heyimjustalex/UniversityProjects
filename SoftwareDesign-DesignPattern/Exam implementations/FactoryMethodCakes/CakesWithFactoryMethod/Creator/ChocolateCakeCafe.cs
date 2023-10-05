using CakesWithFactoryMethod.Product;

namespace CakesWithFactoryMethod.Creator
{
    class ChocolateCakeCafe : AbstractCafe
    {
        protected override ICake CreateCake()
        {
            Console.WriteLine($"Returning created ChocolateCake");
            return new VanillaCake();
        }
    }
}
