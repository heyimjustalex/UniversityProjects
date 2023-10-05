

namespace LightComplicatedExampleStateEventTables
{
    enum LightState
    {
        HighOn, LowOn, Off
    }
   
    enum LightEvent
    {
        ClickPower, ClickMode
    }

    class Light
    {
        private LightState _currentLightState;
        private Dictionary<(LightState, LightEvent), Action> _stateTransitionTable;
        public Light()
        {
            _currentLightState = LightState.Off;
            _stateTransitionTable = new Dictionary<(LightState, LightEvent), Action>
            {
                { (LightState.Off,LightEvent.ClickPower), TurnLightOn},
                { (LightState.LowOn,LightEvent.ClickPower), TurnLightOff},
                { (LightState.HighOn,LightEvent.ClickPower), TurnLightOff},
                { (LightState.Off,LightEvent.ClickMode), ()=>{ Console.WriteLine("Cannot change mode when off. Nothing happens..."); } },
                { (LightState.LowOn,LightEvent.ClickMode),TurnIntensityUp },
                { (LightState.HighOn,LightEvent.ClickMode),TurnIntensityDown },
            };
        }

        public void HandleEvent(LightEvent lightEvent)
        {
            (LightState, LightEvent) key = (_currentLightState, lightEvent);
            if (_stateTransitionTable.TryGetValue(key, out var transition))
            {
                transition.Invoke();
            }
            else
            {
                throw new Exception("Invalid state transition");
            }
        }

        public void PrintCurrentState()
        {
            Console.WriteLine("Current state of light: ");
            Console.WriteLine("State: " + _currentLightState.ToString());

            Console.WriteLine();

        }
        private void TurnLightOn()
        {
            Console.WriteLine("Turning the light On");
            _currentLightState = LightState.LowOn;
        }
        private void TurnLightOff()
        {
            Console.WriteLine("Turning the light Off");
            _currentLightState = LightState.Off;
        }

        private void TurnIntensityUp()
        {
            Console.WriteLine("Turning the intensity Up");
            _currentLightState = LightState.HighOn;
        }
        private void TurnIntensityDown()
        {
            Console.WriteLine("Turning the intensity Down");
            _currentLightState = LightState.LowOn;
        }
    }
}
