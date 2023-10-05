
namespace DataExporterTemplateMethod
{
    public class CsvDataExporter : DataExporter
    {
        protected override void ConnectToDataSource()
        {
            Console.WriteLine("CsvDataExporter: Connecting to the data source...");
        }

        protected override void ExtractData()
        {
            Console.WriteLine("CsvDataExporter: Extracting the data...");
        }

        protected override void LoadDataToDestination()
        {
            Console.WriteLine("CsvDataExporter: Loading data to the destination...");
        }

        protected override void TransformData()
        {
            Console.WriteLine("CsvDataExporter: Transforming data...");
        }
    }
}
