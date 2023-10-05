using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ObserverTeletubbies
{
    internal interface ITeletubbieObserver
    {
        void Update(SubjectData data);

    }
}
