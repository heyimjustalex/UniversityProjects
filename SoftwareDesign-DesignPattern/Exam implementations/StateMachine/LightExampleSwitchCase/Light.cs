

namespace LightExampleSwitchCase
{
    enum LightState
    {
        On, Off
    }
    enum LightEvent 
    {
        Pressed
    }

    class Light
    {
        private LightState _currentLightState;

        public Light()
        {
            _currentLightState = LightState.Off;
        }

        public void HandleEvent(LightEvent lightEvent)
        {
            switch (_currentLightState)
            {
                case LightState.Off:
                    HandleOffState(lightEvent);
                    break;
                case LightState.On: 
                    HandleOnState(lightEvent);
                    break;
                default:
                    throw new Exception("Invalid state");                

            }


        }

        private void HandleOnState(LightEvent lightEvent)
        {
            switch (lightEvent) {

                case LightEvent.Pressed:
                    Console.WriteLine("Turning the light off");
                    _currentLightState = LightState.Off;
                    break;
                default:
                    Console.WriteLine("The current state was On and the event was TurnOn");
                    break;

            }

        }

        private void HandleOffState(LightEvent lightEvent)
        {
            switch (lightEvent)
            {   
                case LightEvent.Pressed:
                    Console.WriteLine("Turning the light on");
                    _currentLightState = LightState.On;
                    break;
                default:
                    Console.WriteLine("The current state was Off and the event was TurnOff");
                    break;

            }

        }
        
        
    }
}
