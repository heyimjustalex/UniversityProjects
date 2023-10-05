using ex2.Entity;
using ex2.FunctionFormaters;
using ex2.ReportFormaters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;

namespace ex2.ReportFormats
{
    class SalaryFirstFormat : ReportFormater
    {          
        public override void printFormatedText(List<Employee> employees)
        {
            Console.WriteLine("Salary-first report");
            IFunctionFormater f = new FieldFirstFormater();
            Func<List<PropertyInfo>, List<PropertyInfo>> formatFunction = f.formater("Salary");
            printAllFieldsOfObject(employees, formatFunction);
        }
    }
}
