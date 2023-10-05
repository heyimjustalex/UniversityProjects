using ex2.Entity;
using ex2.ReportFormaters;
using ex2.ReportFormats;
using System;

namespace ReportGenerator
{
    internal class ReportGeneratorClient
    {
        private static void Main()
        {
            var db = new EmployeeDB();

            // Add some employees
            db.AddEmployee(new Employee("Anne", 3000,10));
            db.AddEmployee(new Employee("Berit", 2000,20));
            db.AddEmployee(new Employee("Christel", 1000,30));

            var reportGenerator = new ReportGenerator(db);

            // Create a default (name-first) report
            IReportFormater formatNameFirst = new NameFirstFormat();
            reportGenerator.CompileReport(formatNameFirst);

            Console.WriteLine("");
            Console.WriteLine("");

            // Create a salary-first report IReportFormater
            IReportFormater formatSalaryFirst = new SalaryFirstFormat();
            reportGenerator.CompileReport(formatSalaryFirst);

            IReportFormater formatAgeLast = new AgeLastFormat();
            reportGenerator.CompileReport(formatAgeLast);
        }
    }
}