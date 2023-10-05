

using ShoppingCartVisitorExample.Visitors;

namespace ShoppingCartVisitorExample.Products
{
    public interface IAcceptVisitor
    {
        public void Accept(IProductVisitor visitor);
    }
}
