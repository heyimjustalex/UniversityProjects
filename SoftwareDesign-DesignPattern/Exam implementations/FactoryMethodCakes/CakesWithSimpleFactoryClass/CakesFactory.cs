

namespace CakesWithSimpleFactory
{
    // We break OCP because every time you add new type of cake you need to modify CakesFactory class (despite the use of ICake)
     class CakesFactory
    {
        public ICake createCake(String cakeType)
        {   
            if (cakeType == "Vanilla")
            {
                ICake cake = new VanillaCake();
                Console.WriteLine($"Returning created VanillaCake");
                return cake;

            }
            else if (cakeType == "Chocolate")
            {
                ICake cake = new ChocolateCake();
                cake.Prepare();
                Console.WriteLine($"Returning created ChocolateCake");
                return cake;
            }
            else
            {
                throw new Exception("There's no such cake");
            }          

        }
    }
}
