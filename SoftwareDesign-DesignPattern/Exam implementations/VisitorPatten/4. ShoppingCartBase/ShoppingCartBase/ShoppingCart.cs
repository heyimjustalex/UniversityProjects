using ShoppingCartVisitorExample.Products;

namespace ShoppingCartBase
{
    public class ShoppingCart
    {
        List<ProductBase> Products; 
       
        public ShoppingCart() {
            Products = new List<ProductBase>();    
        }   

        public void AddProduct(ProductBase product)
        {
            Products.Add(product); 
        }

        public double GetCartValue()
        {
            double value = 0;
            foreach(ProductBase product in Products) {

                value += product.Price;
            
            }
            return value;        
        }

    }
}
