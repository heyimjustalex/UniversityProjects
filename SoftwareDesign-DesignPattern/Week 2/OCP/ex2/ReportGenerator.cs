using System;
using System.Collections.Generic;
using ex2.Entity;
using ex2.ReportFormaters;

namespace ReportGenerator
{
    internal class ReportGenerator
    {
        private readonly EmployeeDB _employeeDb;              
        public ReportGenerator(EmployeeDB employeeDb)
        {
            if (employeeDb == null) throw new ArgumentNullException("employeeDb");
            _employeeDb = employeeDb;
        }
        public void CompileReport(IReportFormater formater)
        {
            var employees = _employeeDb.GetAllEmployees();
            _employeeDb.Reset();
            formater.printFormatedText(employees);

        }
     }
}