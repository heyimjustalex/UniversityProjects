namespace CakesWithFactoryMethod.Product
{
    class VanillaCake : ISweet
    {
        public void Prepare()
        {
            Console.WriteLine($"Preparing VanillaCake");
        }
    }
}
