namespace CakesWithFactoryMethod.Product
{
    public class ChocolateYoghurt : ISweet
    {
        public void Prepare()
        {
            Console.WriteLine($"Preparing ChocolateYoghurt");
        }
    }
}
