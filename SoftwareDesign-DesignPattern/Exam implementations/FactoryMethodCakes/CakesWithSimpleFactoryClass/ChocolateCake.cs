namespace CakesWithSimpleFactory
{
    public class ChocolateCake : ICake
    {
        public void Prepare()
        {
            Console.WriteLine($"Preparing ChoclateCake");
        }
    }
}
