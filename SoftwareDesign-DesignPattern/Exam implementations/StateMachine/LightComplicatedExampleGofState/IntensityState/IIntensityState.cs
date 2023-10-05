namespace LightComplicatedExampleGofState.IntensityState
{
    interface IIntensityState
    {
        public void SetContext(Light light);

        public void SetHigh();
        public void SetLow();
    }
}
