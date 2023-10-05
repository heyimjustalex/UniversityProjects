package SOLID.I.BadCode;

public class Employee implements IEmployee {

    @Override
    public void work() {
        System.out.println("Employee is working");
    }

    @Override
    public void eat() {
        System.out.println("Employee is eating");

    }
}

