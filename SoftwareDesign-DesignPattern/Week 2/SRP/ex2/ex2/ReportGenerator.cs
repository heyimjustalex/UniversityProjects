using ex2.ReportFormater;
using System;
using System.Collections.Generic;

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
            var employees = new List<Employee>();
            _employeeDb.Reset();
            employees = _employeeDb.GetAllEmployees();
            formater.printFormatedText(employees);
        }
     }
}