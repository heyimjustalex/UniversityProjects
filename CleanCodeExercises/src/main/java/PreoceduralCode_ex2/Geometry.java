package PreoceduralCode_ex2;

import PreoceduralCode_ex2.Shapes.Rectangle;
import PreoceduralCode_ex2.Shapes.Square;

public class Geometry
{
    public final double PI = 3.1415;

    public double area (Object shape) throws NoSuchShapeException
    {
        if(shape instanceof Square)
        {
            Square s = (Square) shape;
            return s.side*s.side;
        }
        else if(shape instanceof Rectangle)
        {
            Rectangle r = (Rectangle) shape;
            return r.height * r.width;
        }

        throw new NoSuchShapeException("Shape does not exists in area() Geometry class");

    }
}

