package exceptions.nested;

public class Unchecked {

    public static void main(String[] args) {
        try {
            new Unchecked().functionA();
        }
        catch (RuntimeException e) {
            System.out.println(e.getMessage());
        }
    }

    public void functionA() {
        functionB();
    }

    private void functionB() {
        functionC();
    }

    private void functionC() {
        throw new RuntimeException(
                "Something went wrong at the lowest level!");
    }
}
