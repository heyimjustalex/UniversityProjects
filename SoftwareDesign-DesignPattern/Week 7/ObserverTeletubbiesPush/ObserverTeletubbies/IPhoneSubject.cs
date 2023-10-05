using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace ObserverTeletubbies
{
    internal interface IPhoneSubject
    {
        public void Attach(ITeletubbieObserver observer);
        public void Detach(ITeletubbieObserver observer);
        public void NotifyAll();

    }
}
