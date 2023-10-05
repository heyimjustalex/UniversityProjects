using CakesWithFactoryMethod.Product;

namespace CakesWithFactoryMethod.Creator
{
    class VanillaCakeCafe : AbstractCafe
    {
        protected override ICake CreateCake()
        {
            Console.WriteLine($"Returning created VanillaCake");
            return new VanillaCake();
        }
    }
}
