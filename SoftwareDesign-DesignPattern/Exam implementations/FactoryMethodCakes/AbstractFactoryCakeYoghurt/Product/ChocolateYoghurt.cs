namespace CakesWithFactoryMethod.Product
{
    public class ChocolateYoghurt : IYoghurt
    {
        public void Prepare()
        {
            Console.WriteLine($"Preparing ChocolateYoghurt");
        }
    }
}
