package customcalculation;

import java.math.BigInteger;

public class Demo {

    public static void main(String[] args) {
        try {
            final char[] separators = {',', ';', '.', ':'};
            CustomCalculation calculation = new CustomCalculation(separators);
            BigInteger result = calculation.calculate("123;3,-2:4;+");

            System.out.println("Result: " + result);
        }
        catch (NumberFormatException exception) {
            System.out.println("Incorrect input numbers");
            exception.printStackTrace();
        }
        catch (RuntimeException exception) {
            System.out.println(exception.getMessage());
            exception.printStackTrace();
        }
    }
}
