package exceptions.nonull;

import java.awt.*;
import java.util.Collections;
import java.util.List;

class Employee {

    public int getPay() {
        return 0;
    }
}

public class Demo {

    static int totalPay = 0;

    List<Employee> getEmployees() {
        // ...
        // if (no employees)
        return Collections.emptyList();
    }

    void bad() {

        List<Employee> employees = getEmployees();
        if (employees != null) {
            for (Employee e : employees) {
                totalPay += e.getPay();
            }
        }
    }

    void better() {

        List<Employee> employees = getEmployees();
        for (Employee e : employees) {
            totalPay += e.getPay();
        }
    }

    public double operationOnPoints(Point p1, Point p2) {
        return p2.x - p1.x;
    }

    public double operationOnPoints1(Point p1, Point p2) {
        if (p1 == null || p2 == null) {
            throw new IllegalArgumentException("Point cannot be null");
        }
        return p2.x - p1.x;
    }

    public double operationOnPoints2(Point p1, Point p2) {
        assert p1 != null : "p1 can't be null";
        assert p2 != null : "p2 can't be null";
        return p2.x - p1.x;
    }

    public static void main(String[] args) {
        final double v = new Demo().operationOnPoints(new Point(), new Point());
        final double v1 = new Demo().operationOnPoints1(new Point(), new Point());
        final double v2 = new Demo().operationOnPoints2(new Point(), new Point());
    }
}
