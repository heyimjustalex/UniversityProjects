package SOLID.L.BetterCode1;

import SOLID.L.BetterCode1.Animals.Animal;
import SOLID.L.BetterCode1.Animals.Elephant;
import SOLID.L.BetterCode1.Animals.Shark;

public class Main
{
    public static void main(String[] args)
    {
        // Both animals can move - elephant runs and fish swims

        Animal elephant = new Elephant();
        elephant.move();

        Animal fish = new Shark();
        fish.move();
    }
}


