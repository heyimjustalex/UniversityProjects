package SOLID.D.BetterCode.APIS;

public class PaypalAPI
{
    //PaypalAPI has different method signature than StripeAPI
    public void makePayment(String user, Integer amountInDollars)
    {
        System.out.println(user +" paid " + amountInDollars + "$ with Paypal");
    }
}
