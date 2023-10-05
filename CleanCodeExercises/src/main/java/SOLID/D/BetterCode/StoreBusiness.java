package SOLID.D.BetterCode;

import SOLID.D.BetterCode.PaymentProcessors.IPaymentProcessor;
import SOLID.D.BetterCode.PaymentProcessors.PaypalPaymentProcessor;
import SOLID.D.BetterCode.PaymentProcessors.StripePaymentProcessor;

public class StoreBusiness
{
    //Using unified PaymentProcessor
   IPaymentProcessor paymentProcessor;

    public StoreBusiness(String user)
    {
        //Swapping payment implementation requires changing this one line
        this.paymentProcessor = new StripePaymentProcessor(user);
        //this.paymentProcessor = new PaypalPaymentProcessor(user);

    }

    public void purchaseBike(Integer quantity)
    {
        this.paymentProcessor.pay(200*quantity);
    }

    public void purchaseHelmet(Integer quantity)
    {
        this.paymentProcessor.pay(15*quantity);
    }

}

