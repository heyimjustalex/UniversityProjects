namespace CakesWithSimpleFactory
{
    // This class breaks OCP no more, however CakesFactory does
    // we DO NOT break SRP here, because we only prepare cake and we leave creation for CakesFactory
    class Cafe
    {
        public ICake OrderCake(String cakeType)
        {
            CakesFactory factory = new CakesFactory();
            ICake cake = factory.createCake(cakeType);

            cake.Prepare();

            return cake;

        }
    }
}
