

namespace LightExampleGofState
{
  
    class Light
    {
        private ILightState _currentLightState;

        public Light()
        {
            _currentLightState = new OffState();
            _currentLightState.SetContext(this);
        }

        public void SetState(ILightState state)
        {
            Console.WriteLine($"Invoking SetState -> Changing state to {state.GetType().Name}");
            _currentLightState = state;
            _currentLightState.SetContext(this);
        }

        public void TurnLightOn()
        {
            _currentLightState.TurnOn();
        }

        public void TurnLightOff() { 
             _currentLightState.TurnOff();
        }

        public void PrintCurrentLightState()
        {
           Console.WriteLine("Current state is: "+ _currentLightState.GetType().Name);
            Console.WriteLine();
        }

       
    }
}
