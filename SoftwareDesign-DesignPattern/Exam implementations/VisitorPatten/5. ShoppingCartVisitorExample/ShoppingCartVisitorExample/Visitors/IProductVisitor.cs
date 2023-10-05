using ShoppingCartVisitorExample.Products;

namespace ShoppingCartVisitorExample.Visitors
{
    public interface IProductVisitor
    {
        // Using Visitor in ProductBase forces me to implement Visitor for ProductBase
        public void Visit(ProductBase product);
        public void Visit(Drink drink);
        public void Visit(Fruit fruit);
        public void Visit(Meat meat);
    }
}
