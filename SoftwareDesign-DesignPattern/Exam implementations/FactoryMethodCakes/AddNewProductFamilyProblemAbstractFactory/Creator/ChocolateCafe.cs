using CakesWithFactoryMethod.Product;

namespace CakesWithFactoryMethod.Creator
{
    class ChocolateCafe : AbstractCafe
    {
        //Breaks OCP
        protected override ISweet CreateSweet(string itemType)
        {
            if (itemType == "cake")
            {
                Console.WriteLine($"Returning created ChocolateCake");
                return new ChocolateCake();
            }
            else if(itemType == "yoghurt")
            {
                Console.WriteLine($"Returning created ChocolateYoghurt");
                return new ChocolateYoghurt();
            }
            else 
            {
                throw new Exception("There is no such product");            
            }
           
        }
    }
}
