using CakesWithFactoryMethod.Product;

namespace CakesWithFactoryMethod.Creator
{
    abstract class AbstractCafe
    {
        // Now we created another item type which is Yoghurt and modifier ICake to be ISweet
        // If we want concrete cafes (concrete factories) to be able to produce different items
        // we need to pass itemType (yoghurt or cake)
        // We do again break OCP and to prevent it we should use AbstractFactory instead of FactoryMethod
        public ISweet OrderSweet(string itemType)
        {
            ISweet sweet = CreateSweet(itemType);
            sweet.Prepare();
            Console.WriteLine($"Returning prepared cake of type: {sweet.GetType().Name}");
            return sweet;
        }

        protected abstract ISweet CreateSweet(string itemType);
    }


}
