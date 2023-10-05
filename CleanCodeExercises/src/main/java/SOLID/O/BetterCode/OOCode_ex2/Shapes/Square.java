package SOLID.O.BetterCode.OOCode_ex2.Shapes;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.awt.*;

@Getter
@Setter
@AllArgsConstructor

public class Square implements Shape
{
    private Point topLeft;
    private double side;

    @Override
    public double area()
    {
        return side*side;
    }
}


