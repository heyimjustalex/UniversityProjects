using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CompressionStocking.User
{
    public abstract class IUserInput
    {
        protected IInputHandler hdl;
        public void startButton() { }
        public void stopButtton() { }
        public void SetInputHandler(IInputHandler hdl) { }
    }
}
