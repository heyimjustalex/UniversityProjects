


namespace LightComplicatedExampleGofState
{
    class Program
    {
        public static void Main(string[] args)
        {

            Light light = new Light();
            light.PrintCurrentLightState();
            light.TurnLightOn();
            light.PrintCurrentLightState();
            light.SetLightHigh();
            light.PrintCurrentLightState();
            light.SetLightHigh();
            light.PrintCurrentLightState();
            light.SetLightLow();
            light.PrintCurrentLightState(); 
            light.TurnLightOff();
            light.PrintCurrentLightState();
            light.TurnLightOff();
            light.PrintCurrentLightState();



        }
    }
}