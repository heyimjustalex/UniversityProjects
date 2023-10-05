using System;
using System.Collections.Generic;
using System.Reflection;
using ex2.Entity;

namespace ex2.ReportFormaters
{
    interface IReportFormater
    {
        void printFormatedText(List<Employee> employees);

    }
}
