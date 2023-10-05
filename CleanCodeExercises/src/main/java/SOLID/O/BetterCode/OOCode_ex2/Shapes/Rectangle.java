package SOLID.O.BetterCode.OOCode_ex2.Shapes;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.awt.*;

@Getter
@Setter
@AllArgsConstructor
public class Rectangle implements Shape
{
    private Point topLeft;
    private double height;
    private double width;

    @Override
    public double area()
    {
        return width*height;
    }
}


