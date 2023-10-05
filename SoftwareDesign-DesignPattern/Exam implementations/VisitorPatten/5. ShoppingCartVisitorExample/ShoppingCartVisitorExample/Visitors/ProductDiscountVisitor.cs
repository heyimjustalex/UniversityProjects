using ShoppingCartVisitorExample.Products;


namespace ShoppingCartVisitorExample.Visitors
{
    public class ProductDiscountVisitor : IProductVisitor
    {
        public void Visit(Drink drink)
        {
            // Apply a discount if the drink price is greater than $5
            if (drink.Price > 5)
            {
                double discountAmount = drink.Price * 0.10;
                drink.Price -= discountAmount;
                Console.WriteLine($"Discounted {drink.Name} by ${discountAmount}");
            }
            else
            {
                Console.WriteLine($"{drink.Name} does not qualify for a discount.");
            }
        }

        public void Visit(Fruit fruit)
        {
            // Apply a discount based on origin
     
            if (fruit.Origin=="Poland")
            {
                double discountAmount = fruit.Price * 0.10;           
                fruit.Price -= discountAmount;
                Console.WriteLine($"Discounted {fruit.Name} by ${discountAmount}");
            }
            else
            {
                Console.WriteLine($"{fruit.Name} does not qualify for a discount.");
            }
        }

        public void Visit(Meat meat)
        {
            // Apply a discount if the meat is fresh
            if (meat.IsFresh)
            {
                double discountAmount = meat.Price * 0.05;
                meat.Price -= discountAmount;
                Console.WriteLine($"Discounted {meat.Name} by ${discountAmount}");
            }
            else
            {
                Console.WriteLine($"{meat.Name} does not qualify for a discount.");
            }
        }

        public void Visit(ProductBase product)
        {
            // This needs to be if we want to keep using ProductBase in public void PrintDiscountedCartValue()
            // This makes us have only one : IAcceptVisitor implementation for ProductBase
            // Another solution would be not to imlpement it in ProductBase, and make implement for each of the Products
            // Whole Interface-based implemenetation (without abstract class) seems better and more clear
            // So dont use abstract class, you will pay for it
            Console.WriteLine($"Basic product does not qualify for a discount.");
        }
    }

}
