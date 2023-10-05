namespace LightComplicatedExampleGofState.PowerState
{
    class OffState : IPowerState

    {

        private Light _light;
        public void SetContext(Light light)
        {
            _light = light;
        }


        public void TurnOff()
        {
            Console.WriteLine("This state is already Off. Nothing happens..");
        }

        public void TurnOn()
        {
            _light.SetPowerState(new OnState());
        }
    }
}
