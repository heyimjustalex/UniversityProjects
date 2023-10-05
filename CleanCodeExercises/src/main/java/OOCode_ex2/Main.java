package OOCode_ex2;



import OOCode_ex2.Shapes.Circle;
import OOCode_ex2.Shapes.Square;

import java.awt.*;


public class Main
{
    public static void main(String[] args)
    {
        // Adding new method in Shape interface requires change in ALL OF THE CLASSES that implement Shape
        // We do not need to check instanceof when using methods in Geometry class
        // Adding new Shape DOES NOT REQUIRE change in ANY methods of Geometry class

        Geometry geometry = new Geometry();

        Square square = new Square(new Point(5,4),2);

        Circle circle = new Circle(new Point(2,2),2);

        System.out.println("Square area-> " + geometry.area(square));
        System.out.println("Circle area-> " + geometry.area(circle));

    }
}



