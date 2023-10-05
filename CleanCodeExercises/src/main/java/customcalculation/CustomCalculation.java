package customcalculation;

import java.math.BigInteger;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * Class for performing a calculation on integer numbers given in specific format.
 * For more details see {@link #calculate(String)}.
 */
public class CustomCalculation {

    private char[] separators;

    /**
     *
     * @param separators An array of number separators that are acceptable in
     *                   calculation input.
     */
    public CustomCalculation(char[] separators) {
        if (separators.length == 0) {
            throw new IllegalArgumentException("Separator array cannot be empty");
        }
        this.separators = separators;
    }

    /**
     * Performs calculation on numbers from input in specific format. Type of the performed
     * mathematical operation is specified by an operator at the end of the input.
     *
     * @param input an input String that consist in integer numbers separated
     *              by any of the characters from defined separators.
     *              It should be terminated with one of the following mathematical
     *              operators: +, -, *.
     *              <br><br>
     *              An example input string may look like this: "22;-13,5:52.+"
     *
     * @return result of the calculation performed on input numbers.
     */
    public BigInteger calculate(String input) {
        if (input.isEmpty()) {
            throw new IllegalArgumentException("Input string cannot be empty");
        }

        String operator = getOperator(input);
        String numbersWithSeparators = input.substring(0, input.length() - 1);
        List<Integer> numbers = extractNumbersFrom(numbersWithSeparators);

        return performOperation(operator, numbers);
    }

    private String getOperator(String inputString){

        switch (inputString.substring(inputString.length() - 1)) {
            case "+":
                return "+";
            case "-":
                return "-";
            case "*":
                return "*";
            default:
                throw new RuntimeException("Incorrect or not existing operator at the end of input");
        }
    }

    private List<Integer> extractNumbersFrom(String input) {

        String regex = "[" + new String(separators) + "]";
        List<Integer> numbers = Stream.of(input.split(regex))
                .map(Integer::parseInt)
                .collect(Collectors.toList());

        if (!numbers.isEmpty()) {
            return numbers;
        } else {
            throw new RuntimeException("No numbers found in input");
        }
    }

    private BigInteger performOperation(String operation, List<Integer> numbers) {

        switch (operation) {
            case "+":
                return numbers.stream()
                        .map(BigInteger::valueOf)
                        .reduce(BigInteger.valueOf(0), BigInteger::add);
            case "-":
                return numbers.stream()
                        .map(BigInteger::valueOf)
                        .reduce(BigInteger.valueOf(0), BigInteger::subtract);
            case "*":
                return numbers.stream()
                        .map(BigInteger::valueOf)
                        .reduce(BigInteger.valueOf(1), BigInteger::multiply);
            default:
                throw new RuntimeException("Unexpected error");
        }
    }
}
