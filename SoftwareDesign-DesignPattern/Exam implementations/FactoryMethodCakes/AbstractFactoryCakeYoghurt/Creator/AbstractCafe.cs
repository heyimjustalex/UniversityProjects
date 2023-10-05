using CakesWithFactoryMethod.Product;

namespace CakesWithFactoryMethod.Creator
{
    abstract class AbstractCafe
    {
        // Now we got back to ICake and made IYoghurt interface
        // For each new product we should make new interface
        // We have concrete cafes  (concrete factories) that are able to produce different items
        // By creating two methods for creating each of the Products (Yoghurt and Cake) CreateYoghurt and CreateCake
        // We managed make it OCP compliant
        // We should probably move OrderCake and OrderYoghurt classes out of here, but I leave them so it's similar to other exammples

        // We can now create new flavours, new products and when modifying we just need to add new method here for each of new products
        // Implementing new product however forces it to be implemented in all of the ConcreteCafe (ConcreteFactories)
        public ICake OrderCake()
        {
            ICake cake = CreateCake();
            cake.Prepare();
            Console.WriteLine($"Returning prepared cake of type: {cake.GetType().Name}");
            return cake;
        }

        public IYoghurt OrderYoghurt()
        {
            IYoghurt yoghurt = CreateYoghurt();
            yoghurt.Prepare();
            Console.WriteLine($"Returning prepared cake of type: {yoghurt.GetType().Name}");
            return yoghurt;
        }

        protected abstract ICake CreateCake();
        protected abstract IYoghurt CreateYoghurt();
    }


}
