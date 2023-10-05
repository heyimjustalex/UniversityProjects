package client;

import common.Task;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.IntStream;

public class PrimeNumber implements Task<List<Integer>> {

    private Integer howManyPrimeNumbers;
    private Integer startPosition;
    List<Integer> generatedPrimeNumbers;

    public PrimeNumber(Integer howManyPrimeNumbers, Integer startPosition) {
        this.howManyPrimeNumbers = howManyPrimeNumbers;
        this.startPosition = startPosition;
        this.generatedPrimeNumbers = new ArrayList<>();
    }

    public List<Integer> calculatePrimes() {
        return IntStream.iterate(startPosition + 1, i -> i + 1)
                .filter(PrimeNumber::isPrime).boxed()
                .limit(howManyPrimeNumbers)
                .toList();
    }

    private static boolean isPrime(int number) {
        return IntStream.rangeClosed(2, (int) (Math.sqrt(number)))
                .allMatch(n -> number % n != 0);
    }

    public List<Integer> execute() {
        return calculatePrimes();
    }

}
