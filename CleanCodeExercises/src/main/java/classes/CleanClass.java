package classes;

public class CleanClass {

    public static String PUBLIC_STATIC_STRING = "public_static_string";
    public static Integer PUBLIC_STATIC_INT = 1;

    private static final Double privateStaticDouble = 2.0;

    private int x;
    private int y;

    String s;



    public CleanClass(int x, int y) {
        this.x = x;
        this.y = y;
    }

    public void publicFunction() {
        privateFunction();
    }

    private void privateFunction() {
        // ...
    }

    private void f() {
        x = 2;
        y = 3;
        int z = x + y;
    }

    public static void main(String[] args) {
        final CleanClass cleanClass = new CleanClass(2, 3);
        cleanClass.publicFunction();

        final Integer publicStaticInt = PUBLIC_STATIC_INT;
        final String publicStaticString = PUBLIC_STATIC_STRING;

        final Double privateStaticDouble = CleanClass.privateStaticDouble;

    }
}
