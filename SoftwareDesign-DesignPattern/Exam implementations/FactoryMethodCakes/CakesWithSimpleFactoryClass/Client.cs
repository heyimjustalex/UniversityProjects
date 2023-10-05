

namespace CakesWithSimpleFactory
{
    class Client
    {
        public static void Main(string[] args)
        {
            Cafe cafe = new Cafe();
            cafe.OrderCake("Vanilla");
        }
    }
}
