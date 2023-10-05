using ShoppingCartVisitorExample.Products;
using ShoppingCartVisitorExample.Visitors;

namespace ShoppingCartVisitorExample
{
    public class ShoppingCart
    {
        public List<ProductBase> Products;

        public ShoppingCart()
        {
            Products = new List<ProductBase>();
        }

        public void AddProduct(ProductBase product)
        {
            Products.Add(product);
        }

        public double GetCartValue()
        {
            double value = 0;
            foreach (ProductBase product in Products)
            {           
                    value += product.Price;            
            }
            return value;
        }

        public void PrintDiscountedCartValue()
        {
            IProductVisitor visitor = new ProductDiscountVisitor();
            foreach (ProductBase product in Products) { 
            
                product.Accept(visitor);
            }

        }

    }
}
