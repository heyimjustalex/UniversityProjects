package SOLID.L.BadCode;

import SOLID.L.BadCode.Animals.Animal;
import SOLID.L.BadCode.Animals.Elephant;
import SOLID.L.BadCode.Animals.Shark;

public class Main
{
    public static void main(String[] args)
    {
        Animal elephant = new Elephant();
        elephant.run();

        ///Shark is forced to implement running method that does not work
        Animal fish = new Shark();
        fish.run();
    }

}


