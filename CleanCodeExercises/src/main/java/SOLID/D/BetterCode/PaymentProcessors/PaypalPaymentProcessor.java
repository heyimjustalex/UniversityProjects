package SOLID.D.BetterCode.PaymentProcessors;

import SOLID.D.BetterCode.APIS.PaypalAPI;

public class PaypalPaymentProcessor implements IPaymentProcessor
{
    PaypalAPI paypal;
    String user;

    public PaypalPaymentProcessor(String user)
    {
        this.paypal = new PaypalAPI();
        this.user = user;
    }

    @Override
    public void pay(Integer amountInDollars)
    {
        paypal.makePayment(user, amountInDollars);
    }
}




