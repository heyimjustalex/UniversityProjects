package SOLID.O.BetterCode.OOCode_ex2.Shapes;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.awt.*;

@Getter
@Setter
@AllArgsConstructor
public class Circle implements Shape
{
    private Point center;
    private double radius;

    @Override
    public double area()
    {
        return radius*PI;
    }
}

