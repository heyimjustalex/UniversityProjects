package SOLID.D.BetterCode.APIS;

public class StripeAPI
{
    //StripeAPI has different method signature than paypalAPI
    private String user;

    public StripeAPI(String user)
    {
        this.user = user;
    }

    public void makePayment(Integer amountInCents)
    {
        System.out.println(this.user +" paid " + amountInCents/100 + "$ with Stripe");
    }
}
