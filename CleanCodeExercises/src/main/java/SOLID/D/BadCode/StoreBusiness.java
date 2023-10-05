package SOLID.D.BadCode;

public class StoreBusiness
{
    //This Store business class depends on StripeAPI
    //If you want to change paymentAPI you need to edit all business functions in this class

    StripeAPI stripe;

    public StoreBusiness(String user)
    {
        this.stripe = new StripeAPI(user);
    }

    public void purchaseBike(Integer quantity)
    {
        this.stripe.makePayment(200*quantity*100);
    }

    public void purchaseHelmet(Integer quantity)
    {
        this.stripe.makePayment(15*quantity*100);
    }
}


