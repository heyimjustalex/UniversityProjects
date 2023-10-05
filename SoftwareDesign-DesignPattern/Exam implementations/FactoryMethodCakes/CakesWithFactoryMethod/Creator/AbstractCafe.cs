using CakesWithFactoryMethod.Product;

namespace CakesWithFactoryMethod.Creator
{
    abstract class AbstractCafe
    {
        // We do not need no more cakeType passed as String like that
        //    public ICake OrderCake(String cakeType)

        // OrderCake just uses abstract method implemented by subclasses to create specific Cake type
        // We do not break OCP, it's easy to add new CakeType by inheriting AbstractCafe class
        public ICake OrderCake()
        {
            ICake cake = CreateCake();
            cake.Prepare();
            Console.WriteLine($"Returning prepared cake of type: {cake.GetType().Name}");
            return cake;
        }

        protected abstract ICake CreateCake();
    }


}
