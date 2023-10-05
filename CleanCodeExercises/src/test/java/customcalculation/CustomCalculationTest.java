package customcalculation;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Nested;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.function.Executable;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;

import java.math.BigInteger;

import static org.junit.jupiter.api.Assertions.*;

import static org.assertj.core.api.Assertions.*;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.*;

class CustomCalculationTest {

    @Test
    void simpleTest() {
        int number1 = 2;
        int number2 = 4;
        int result = number1 + number2;

        assertThat(result, equalTo(6));
    }

    private CustomCalculation customCalculation;


    @BeforeEach
    void setup() {
        char[] separators = {';', '.', ':'};
        customCalculation = new CustomCalculation(separators);
    }

    @Test
    void should_addCorrectly_when_correctInput() {
        // given
        String input = "12;43;2+";

        // when
        BigInteger result = customCalculation.calculate(input);

        // then
        BigInteger expected = BigInteger.valueOf(57);
        assertEquals(expected, result);
    }

    @Nested
    class CalculateTests {

        @Test
        void givenCorrectInput_whenAdd_thenReturnCorrectResult() {
            assertEquals(BigInteger.valueOf(57), customCalculation.calculate("12;43;2+"));
        }

        @ParameterizedTest
        @CsvSource(
                delimiter = ',',
                value = {
                        "12;43;2+, 57",
                        "12;43;2-, -57",
                        "12;43;2*, 1032"
                })
        void should_calculateCorrectly_when_correctInput(String input, String expectedResult) {
            // given input
            // when
            BigInteger actualResult = customCalculation.calculate(input);

            // then
            int expected = Integer.parseInt(expectedResult);
            assertEquals(BigInteger.valueOf(expected), actualResult);
        }

        @ParameterizedTest
        @CsvSource(
                delimiter = ',',
                value = {
                        "-12;43;2+, 33",
                        "12;-43;2+, -29",
                        "12;43;-2+, 53",
                        "-12;-43;-2+, -57",
                        // ...
                })
        void should_calculateCorrectly_when_negativeInputNumbersExist(String input, String expectedResult) {
            // given input
            // when
            BigInteger actualResult = customCalculation.calculate(input);

            // then
            int expected = Integer.parseInt(expectedResult);
            assertEquals(BigInteger.valueOf(expected), actualResult);
        }

        @Test
        void should_subtractCorrectly_when_correctInput() {
            // given
            String input = "12;43;2-";

            // when
            BigInteger result = customCalculation.calculate(input);

            // then
            BigInteger expected = BigInteger.valueOf(-57);
            assertEquals(expected, result);
        }

        @Test
        void should_multiplyCorrectly_when_correctInput() {
            // given
            String input = "12;43;2*";

            // when
            BigInteger result = customCalculation.calculate(input);

            // then
            BigInteger expected = BigInteger.valueOf(1032);
            assertEquals(expected, result);
        }

        @Test
        void should_workCorrectly_when_onlyOneNumberIsGiven() {
            // given
            String input = "12+";

            // when
            BigInteger result = customCalculation.calculate(input);

            // then
            BigInteger expected = BigInteger.valueOf(12);
            assertEquals(expected, result);
        }

        @Test
        void should_throwException_when_inputEmpty() {
            // given
            String emptyString = "";

            // when
            Executable executable =
                    () -> customCalculation.calculate(emptyString);

            // then
            assertThrows(IncorrectInputException.class, executable);
        }

        @Test
        void should_throwException_when_numbersAreMissing() {
            // given
            String justOperator = "+";

            // when
            Executable executable = () -> customCalculation.calculate(justOperator);

            // then
            assertThrows(IncorrectInputException.class, executable);
        }

        @Test
        void should_throwException_when_OperatorIsMissing() {
            // given
            String inputWithoutOperator = "12;43;";

            // when
            Executable executable =
                    () -> customCalculation.calculate(inputWithoutOperator);

            // then
            assertThrows(IncorrectInputException.class, executable);
        }

        @Test
        void should_throwException_when_numbersAreIncorrect() {
            // given
            String incorrectNumbers = "12;43/;31;+";

            // when
            Executable executable = () -> customCalculation.calculate(incorrectNumbers);

            // then
            assertThrows(NumberFormatException.class, executable);
        }

    }
}

class IncorrectInputException extends RuntimeException {

}