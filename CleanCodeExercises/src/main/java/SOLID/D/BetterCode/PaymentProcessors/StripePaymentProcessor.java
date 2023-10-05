package SOLID.D.BetterCode.PaymentProcessors;
import SOLID.D.BetterCode.APIS.StripeAPI;

public class StripePaymentProcessor implements IPaymentProcessor
{
    StripeAPI stripe;
    String user;

    public StripePaymentProcessor(String user)
    {
        this.user = user;
        this.stripe = new StripeAPI(user);
    }

    @Override
    public void pay(Integer amountInDollars)
    {
        stripe.makePayment(amountInDollars);
    }
}

