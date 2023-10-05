namespace LightComplicatedExampleGofState.IntensityState
{
    class LowState : IIntensityState
    {

        private Light _light;
        public void SetContext(Light light)
        {
            _light = light;
        }

        public void SetHigh()
        {
            if (!_light.isCurrentPowerOn())
            {
                Console.WriteLine("Power is not on, cannot modify intensity");
                return;
            }
            _light.SetIntensityState(new HighState());
        }

        public void SetLow()
        {
            if (!_light.isCurrentPowerOn())
            {
                Console.WriteLine("Power is not on, cannot modify intensity");
                return;
            }
            Console.WriteLine("Intensity state is already set Low. Nothing has changed...");
        }
    }
}
