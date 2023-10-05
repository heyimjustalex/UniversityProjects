package SOLID.D.BadCode;

public class Main {
    public static void main(String[] args) {
        //Store using StripeAPI
        StoreBusiness store1 = new StoreBusiness("Alex1");
        store1.purchaseBike(2);
        store1.purchaseHelmet(3);

        //Modified Store using paypalAPI
        StoreBusiness2 store2 = new StoreBusiness2("Alex2");
        store2.purchaseBike(2);
        store2.purchaseHelmet(3);

    }
}
