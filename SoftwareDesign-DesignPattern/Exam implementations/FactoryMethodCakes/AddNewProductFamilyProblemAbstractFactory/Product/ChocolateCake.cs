namespace CakesWithFactoryMethod.Product
{
    public class ChocolateCake : ISweet
    {
        public void Prepare()
        {
            Console.WriteLine($"Preparing ChoclateCake");
        }
    }
}
