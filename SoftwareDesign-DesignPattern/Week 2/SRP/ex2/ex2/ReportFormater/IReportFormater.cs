using ReportGenerator;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ex2.ReportFormater
{
    internal interface IReportFormater
    {
        void printFormatedText(List<Employee> employees);
    }
}
