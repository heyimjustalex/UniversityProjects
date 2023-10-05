using CakesWithFactoryMethod.Product;

namespace CakesWithFactoryMethod.Creator
{
    class VanillaCafe : AbstractCafe
    {
        protected override ICake CreateCake()
        {
            Console.WriteLine($"Returning created VanillaCake");
            return new VanillaCake();

        }

        protected override IYoghurt CreateYoghurt()
        {
            Console.WriteLine($"Returning created VanillaYoghurt");
            return new VanillaYoghurt();    

        }
    }
}
