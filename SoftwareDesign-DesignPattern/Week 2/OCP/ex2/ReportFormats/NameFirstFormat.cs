using System;
using System.Collections.Generic;
using System.Reflection;
using ex2.Entity;
using ex2.FunctionFormaters;
using ex2.ReportFormaters;

namespace ex2.ReportFormats
{
    class NameFirstFormat : ReportFormater
    {
        public override void printFormatedText(List<Employee> employees)
        {
            Console.WriteLine("Name-first report");
            IFunctionFormater f = new FieldFirstFormater();
            Func<List<PropertyInfo>, List<PropertyInfo>> formatFunction = f.formater("Name");
            printAllFieldsOfObject(employees, formatFunction);
        }
     
    }
}
