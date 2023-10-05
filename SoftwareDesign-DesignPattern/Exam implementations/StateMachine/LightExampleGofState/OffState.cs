
namespace LightExampleGofState
{
    class OffState : ILightState
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
            Console.WriteLine("Turning light On");
            _light.SetState(new OnState());
        }
    }
}
