using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace ex2.FunctionFormaters
{
    public interface IFunctionFormater
    {
        Func<List<PropertyInfo>, List<PropertyInfo>> formater(string fieldNameToBeModified);
    }
}
