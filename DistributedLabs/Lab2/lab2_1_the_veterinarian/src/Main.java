import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) throws InterruptedException {
        WaitingRoom waitingRoom = new WaitingRoom();

        List<Cat> cats = new ArrayList<Cat>();

        List<Dog> dogs = new ArrayList<Dog>();

        List <Thread> threads = new ArrayList<>();
        for (int i=0;i<10;i++){
            cats.add(new Cat(waitingRoom));
            dogs.add(new Dog(waitingRoom));
            threads.add(new Thread(cats.get(i)));
            threads.add(new Thread(dogs.get(i)));


        }

        for (int i=0;i<20;i++){

            threads.get(i).start();

        }
        System.out.println("I have started all threads!");

        for (int i=0;i<20;i++) {
            threads.get(i).join();
        }



    }
}