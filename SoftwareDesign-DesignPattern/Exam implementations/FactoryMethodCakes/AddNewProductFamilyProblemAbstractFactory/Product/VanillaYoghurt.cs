namespace CakesWithFactoryMethod.Product
{
    class VanillaYoghurt : ISweet
    {
        public void Prepare()
        {
            Console.WriteLine($"Preparing VanillaYoghurt");
        }
    }
}
