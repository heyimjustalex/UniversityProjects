using ShoppingCartVisitorExample;
using ShoppingCartVisitorExample.Products;

namespace ShoppingCartVisistorExample
{
    class Program
    {
        public static void Main(string[] args) { 
        
            Fruit apple = new Fruit(1, "McIntosh", "Delicious apple", "Red","Poland",true,2.00);
            Meat steak = new Meat(2, "T-Bone Steak", "Delicious steak", "Meat", true, "steak", 20.00);
            Drink coke = new Drink(3, "Coke", "Delicious coca-cola", "Non-sugar",300,"Cherry",0.5);

            ShoppingCart cart = new ShoppingCart();

            cart.AddProduct(apple);
            cart.AddProduct(steak);
            cart.AddProduct(coke);

            Console.WriteLine($"Total cost of items in the shopping cart: {cart.GetCartValue()}");
            cart.PrintDiscountedCartValue();

        }
    }
}
