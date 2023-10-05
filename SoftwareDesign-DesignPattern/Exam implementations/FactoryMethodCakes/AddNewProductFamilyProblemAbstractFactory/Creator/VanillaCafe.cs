using CakesWithFactoryMethod.Product;

namespace CakesWithFactoryMethod.Creator
{
    class VanillaCafe : AbstractCafe
    {
        //Breaks OCP
        protected override ISweet CreateSweet(string itemType)
        {
            if (itemType == "cake")
            {
                Console.WriteLine($"Returning created VanillaCake");
                return new VanillaCake();
            }
            else if (itemType == "yoghurt")
            {
                Console.WriteLine($"Returning created VanillaYoghurt");
                return new VanillaYoghurt();
            }
            else
            {
                throw new Exception("There is no such product");
            }
        }
    }
}
