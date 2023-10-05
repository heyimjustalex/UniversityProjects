package SOLID.L.BetterCode2;


import SOLID.L.BetterCode2.Animals.Elephant;
import SOLID.L.BetterCode2.Animals.Fish;
import SOLID.L.BetterCode2.Animals.Mammal;
import SOLID.L.BetterCode2.Animals.Shark;

public class Main
{
    public static void main(String[] args)
    {
        // Different interfaces for different spieces
        Mammal elephant = new Elephant();
        elephant.run();

        Fish shark = new Shark();
        shark.swim();
    }

}


