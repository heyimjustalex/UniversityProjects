using ex2.Entity;
using ex2.FunctionFormaters;
using ex2.ReportFormaters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace ex2.ReportFormats
{
    internal class AgeLastFormat : ReportFormater
    {       

        public override void printFormatedText(List<Employee> employees)
        {
            Console.WriteLine("Age-last report");
            IFunctionFormater f = new FieldLastFormater();
            Func<List<PropertyInfo>, List<PropertyInfo>> formatFunction = f.formater("Age");
            printAllFieldsOfObject(employees, formatFunction);
        }
    }
}
