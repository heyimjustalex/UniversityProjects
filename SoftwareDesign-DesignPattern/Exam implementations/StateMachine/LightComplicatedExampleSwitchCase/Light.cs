

namespace LightExampleSwitchCase
{
 
    enum LightIntensityState
    {
        High, Low
    }
    enum LightPowerState
    {
        On, Off
    }
    enum LightEvent 
    {
        ClickPower,ClickMode
    }

    class Light
    {
       
        private LightPowerState _currentPowerState;
        private LightIntensityState _currentIntensityState;
        public Light()
        {
            _currentPowerState = LightPowerState.Off;
            _currentIntensityState = LightIntensityState.Low;            
        }

        public void PrintCurrentState()
        {
            Console.WriteLine("Current state of light: ");
            Console.WriteLine("POWER: " + _currentPowerState.ToString());
            Console.WriteLine("INTENSITY: " + _currentIntensityState.ToString());
            Console.WriteLine();

        }
        public void HandleEvent(LightEvent lightEvent)
        {
            switch (_currentPowerState)
            {
                case LightPowerState.Off:
                    HandleOffState(lightEvent);
                    break;
                case LightPowerState.On:
                    HandleOnState(lightEvent);
                    break;
                default:
                    throw new Exception("Invalid _currentPowerState");                

            }


        }
 

        private void HandleOnState(LightEvent lightEvent)
        {
            switch (lightEvent) {

                case LightEvent.ClickPower:
                    Console.WriteLine("Turning the light off and changing intensity to Low");
                    _currentPowerState = LightPowerState.Off;
                    _currentIntensityState = LightIntensityState.Low;
                    break;
                case LightEvent.ClickMode:
                    Console.WriteLine("The light is on and you clicked MODE");
                    HandleIntensityState();
                        break;
                default:
                    Console.WriteLine("The currentPowerState was On and there is error. If you see this message sth is wrong. Nothing happens...");
                    break;

            }

        }

        private void HandleIntensityState()
        {
            switch (_currentIntensityState)
            {
                case LightIntensityState.Low:
                    Console.WriteLine("Changing intensity to High");
                    _currentIntensityState = LightIntensityState.High;         
                    
                    break;
                case LightIntensityState.High:
                    Console.WriteLine("Changing intensity to Low");
                    _currentIntensityState = LightIntensityState.Low;
                    break;
                default:
                    throw new Exception("Invalid _currentIntensityState ");
                  
            }
        }

        private void HandleOffState(LightEvent lightEvent)
        {
            switch (lightEvent)
            {   
                case LightEvent.ClickPower:
                    Console.WriteLine("Turning the light on");
                    _currentPowerState = LightPowerState.On;
                    break;

                default:
                    Console.WriteLine("The currentPowerState was Off and the event was not power On. Nothing happens... ");
                    break;

            }

        }

  
        
        
    }
}
