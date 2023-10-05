namespace LightComplicatedExampleGofState.PowerState
{
    interface IPowerState
    {
        public void SetContext(Light light);
        public void TurnOn();
        public void TurnOff();
    }
}
