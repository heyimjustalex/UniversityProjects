namespace CakesWithFactoryMethod.Product
{
    class VanillaYoghurt : IYoghurt
    {
        public void Prepare()
        {
            Console.WriteLine($"Preparing VanillaYoghurt");
        }
    }
}
