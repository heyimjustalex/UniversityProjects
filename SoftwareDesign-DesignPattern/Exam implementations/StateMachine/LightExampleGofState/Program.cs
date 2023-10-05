
namespace LightExampleGofState
{
    class Program
    {
        public static void Main(string[] args) { 
        
            Light light = new Light();
            light.PrintCurrentLightState();
            light.TurnLightOn();
            light.PrintCurrentLightState();
            light.TurnLightOn();
            light.PrintCurrentLightState();
            light.TurnLightOff();   
            light.PrintCurrentLightState(); 
            light.TurnLightOff();
            light.PrintCurrentLightState();
          
        
        }
    }
}