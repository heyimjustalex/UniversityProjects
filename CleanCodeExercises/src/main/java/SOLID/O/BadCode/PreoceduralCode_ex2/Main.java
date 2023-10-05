package SOLID.O.BadCode.PreoceduralCode_ex2;

import SOLID.O.BadCode.PreoceduralCode_ex2.Shapes.Circle;
import SOLID.O.BadCode.PreoceduralCode_ex2.Shapes.Square;

import java.awt.*;


public class Main {
    public static void main(String[] args)
    {
        // Adding new method in Geometry class does not require any changes in Shapes
        // (Although it requires checking instanceof Shape)
        // Adding new Shape requires change in ALL METHODS of Geometry class

        Square square = new Square();
        square.side = 4;
        square.topLeft = new  Point(5,4);

        Geometry geometry = new Geometry();
        Circle circle = new Circle();
        circle.center = new Point(2,2);
        circle.radius = 3;

        try
        {
            System.out.println(geometry.area(square));
            System.out.println(geometry.area(circle));
        }
        catch (Exception exception)
        {
            exception.printStackTrace();
        }
    }
}
