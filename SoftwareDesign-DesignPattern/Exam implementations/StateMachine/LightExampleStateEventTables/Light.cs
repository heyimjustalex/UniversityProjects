


namespace LightExampleStateEventTables
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
        private Dictionary<(LightState, LightEvent), Action> _stateTransitionTable;
        public Light()
        {
            _currentLightState = LightState.Off;
            _stateTransitionTable = new Dictionary<(LightState, LightEvent), Action>
            {
                {(LightState.Off,LightEvent.Pressed), TurnLightOn },
                {(LightState.On, LightEvent.Pressed), TurnLightOff}

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
        private void TurnLightOn()
        {
            Console.WriteLine("Turning the light On");
            _currentLightState = LightState.On;
        }

        private void TurnLightOff()
        {
            Console.WriteLine("Turning the light Off");
            _currentLightState = LightState.Off;
        }
    }

    }

