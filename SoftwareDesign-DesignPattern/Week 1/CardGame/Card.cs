
using CardGame;

class Card
{
    string _color;
    int _value;

    public Card(string color, int value)
    {
        _color = color;
        _value = value;
    }
    public string color
    {
        get => _color;
        set => _color = value;
    }

    public int value
    {
        get => _value;
        set => _value = value;
    }

    public string getAllCardProperties()
    {
        return "Color: " + _color + " | Value: " + _value.ToString() + " | (Multiplier: " + Colors.getMultiplierOfColor(_color).ToString() + ")";
    }
}