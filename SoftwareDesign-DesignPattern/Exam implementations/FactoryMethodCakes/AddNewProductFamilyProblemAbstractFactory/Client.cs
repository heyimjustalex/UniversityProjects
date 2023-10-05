

using CakesWithFactoryMethod.Creator;
using CakesWithFactoryMethod.Product;

namespace CakesWithFactoryMethod
{
    class Client
    {
        public static void Main(string[] args)
        {
           VanillaCafe vanillaFactory = new VanillaCafe();
           ChocolateCafe chocolateFactory = new ChocolateCafe();
            ISweet vanillaCake = vanillaFactory.OrderSweet("cake");
            ISweet chocolateYoghurt = chocolateFactory.OrderSweet("yoghurt");

        }
    }
}
