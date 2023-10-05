package exceptions.nested;

public class Checked {

    public static void main(String[] args) {
        try {
            new Checked().functionA();
        }
        catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public void functionA() throws Exception {
        functionB();
    }

    private void functionB() throws Exception {
        functionC();
    }

    private void functionC() throws Exception {
        throw new Exception(
                "Something went wrong at the lowest level!");
    }
}

