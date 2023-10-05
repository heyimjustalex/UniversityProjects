package SOLID.I.BetterCode;

public class Employee implements IWork, IEat {

    @Override
    public void work() {
        System.out.println("Employee is working");
    }

    @Override
    public void eat() {
        System.out.println("Employee is eating");

    }
}
