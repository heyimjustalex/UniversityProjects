

using ShoppingCartVisitorExample.Visitors;

namespace ShoppingCartVisitorExample.Products
{
    public abstract class ProductBase:IAcceptVisitor
    {
        public int Code { get; set; } 
        public string Name { get; set; }    
        public string Description { get; set; } 
        public string Category { get; set; }

        public double Price { get; set; } 

        public ProductBase(int code, string name, string description, string category, double price)
        {
            Code = code;
            Name = name;
            Description = description;
            Category = category;
            Price = price;
        }

        public override string ToString()
        {
            return $"Code: {Code}, Name: {Name}, Description: {Description}, Category: {Category}";
        }

        // I need to implement it in abstract class in order to use Accept on every element in ShoppingCart (there is List<ProductBase that visitor is called on)
        public void Accept(IProductVisitor visitor)
        {
            visitor.Visit(this);

        }
    }
}
