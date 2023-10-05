using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LightComplicatedExampleGofState.PowerState
{
    class OnState : IPowerState
    {

        private Light _light;
        public void SetContext(Light light)
        {
            _light = light;
        }

        public void TurnOff()
        {
            _light.SetPowerState(new OffState());
        }

        public void TurnOn()
        {
            Console.WriteLine("This state is already On. Nothing happens..");
        }
    }
}
