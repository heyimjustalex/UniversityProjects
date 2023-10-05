package SOLID.I.BadCode;

public class Robot implements IEmployee{

    @Override
    public void work() {
        System.out.println("Robot is working");
    }

    @Override
    public void eat() {
        // Robot cannot eat and method cannot be implemented

    }
}

