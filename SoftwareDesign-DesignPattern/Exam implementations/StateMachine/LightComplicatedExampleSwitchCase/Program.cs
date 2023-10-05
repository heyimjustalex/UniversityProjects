namespace LightExampleSwitchCase
{
    class Program
    {
        static void Main(string[] args) {
            
            Light light = new Light();
            light.PrintCurrentState();
            light.HandleEvent(LightEvent.ClickMode);
            light.PrintCurrentState();  
            light.HandleEvent(LightEvent.ClickPower);
            light.PrintCurrentState();
            light.HandleEvent(LightEvent.ClickMode);    
            light.PrintCurrentState();  
            light.HandleEvent(LightEvent.ClickMode);    
            light.PrintCurrentState();
            light.HandleEvent(LightEvent.ClickPower);
            light.PrintCurrentState();

            light.HandleEvent(LightEvent.ClickPower);
            light.PrintCurrentState();
            light.HandleEvent(LightEvent.ClickMode);
            light.PrintCurrentState();
            light.HandleEvent(LightEvent.ClickPower);
            light.PrintCurrentState();


        }
    }
}