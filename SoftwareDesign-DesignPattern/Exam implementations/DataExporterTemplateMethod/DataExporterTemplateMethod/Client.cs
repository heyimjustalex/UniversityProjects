
namespace DataExporterTemplateMethod
{
    class Client
    {
        public static void Main(string[] args)
        {
            DataExporter csvExporter = new CsvDataExporter();
            DataExporter dbExporter = new DatabaseDataExporter();

            Console.WriteLine("Launching ExportData() from CsvDataExporter:");
            csvExporter.ExportData();

            Console.WriteLine("\nLaunching ExportData() from DatabaseDataExporter:");
            dbExporter.ExportData();
        }
    }
}