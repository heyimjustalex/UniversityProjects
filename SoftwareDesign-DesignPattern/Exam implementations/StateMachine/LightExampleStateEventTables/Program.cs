namespace LightExampleStateEventTables
{
    class Program
    {
        static void Main(string[] args) {

            Light light = new Light();
            light.HandleEvent(LightEvent.Pressed);
            light.HandleEvent(LightEvent.Pressed);
            light.HandleEvent(LightEvent.Pressed);
        }
    }
}