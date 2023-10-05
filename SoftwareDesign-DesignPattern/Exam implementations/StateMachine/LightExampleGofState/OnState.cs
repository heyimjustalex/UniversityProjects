

namespace LightExampleGofState
{
    class OnState : ILightState
    {
        private Light _light;
        public void SetContext(Light light)
        {
            _light = light; 
        }

        public void TurnOff()
        {
            Console.WriteLine("Turning light Off");
            _light.SetState(new OffState());
           
        }

        public void TurnOn()
        {
            Console.WriteLine("The state is already on. Nothing happens...");

        }
    }
}
