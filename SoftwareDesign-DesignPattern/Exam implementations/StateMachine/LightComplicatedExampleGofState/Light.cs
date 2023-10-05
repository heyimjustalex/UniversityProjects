

using LightComplicatedExampleGofState.IntensityState;
using LightComplicatedExampleGofState.PowerState;

namespace LightComplicatedExampleGofState
{
    class Light
    {
        IPowerState _currentPowerState;
        IIntensityState _currentIntensityState;    
        public Light() {

            _currentPowerState = new OffState();            
            _currentIntensityState = new LowState();    
            
            _currentPowerState.SetContext(this);
            _currentIntensityState.SetContext(this);    
        
        }

        public void SetPowerState(IPowerState powerState)
        {
            Console.WriteLine($"Invoking SetPowerState -> Changing state to {powerState.GetType().Name}");
            _currentPowerState = powerState;
            _currentPowerState.SetContext(this);
        } 

        public void SetIntensityState(IIntensityState intensityState)
        {
            Console.WriteLine($"Invoking SetState -> Changing state to {intensityState.GetType().Name}");
            _currentIntensityState = intensityState;
            _currentIntensityState.SetContext(this);
        }

        public bool isCurrentPowerOn()
        {
            return _currentPowerState is OnState;
        }

        public void PrintCurrentLightState()
        {
            Console.WriteLine("Current powerState is: " + _currentPowerState.GetType().Name);
            Console.WriteLine("Current intensityState is: " + _currentIntensityState.GetType().Name);
            Console.WriteLine();
        }


        public void TurnLightOn()
        {
            _currentPowerState.TurnOn();    
        }

        public void TurnLightOff() { 
            _currentPowerState.TurnOff();
        
        }

        public void SetLightHigh()
        {
            _currentIntensityState.SetHigh();

        }

        public void SetLightLow()
        {
            _currentIntensityState.SetLow();

        }

    }
}
