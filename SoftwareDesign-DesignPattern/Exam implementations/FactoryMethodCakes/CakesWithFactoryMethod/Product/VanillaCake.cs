namespace CakesWithFactoryMethod.Product
{
    class VanillaCake : ICake
    {
        public void Prepare()
        {
            Console.WriteLine($"Preparing VanillaCake");
        }
    }
}
