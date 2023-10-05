package SOLID.D.BadCode;

public class StoreBusiness2
{
    //This Store business class depends on paypalAPI
    //It shows modification that needs to be done when swapping StripeAPI with PaypalAPI
    //If you want to change paymentAPI you need to edit all business functions in this class

    PaypalAPI paypal;
    String user;

    public StoreBusiness2(String user)
    {
        this.paypal = new PaypalAPI();
        this.user = user;
    }

    public void purchaseBike(Integer quantity)
    {
        this.paypal.makePayment(user,200*quantity);
    }

    public void purchaseHelmet(Integer quantity)
    {
        this.paypal.makePayment(user, 15*quantity);
    }

}
