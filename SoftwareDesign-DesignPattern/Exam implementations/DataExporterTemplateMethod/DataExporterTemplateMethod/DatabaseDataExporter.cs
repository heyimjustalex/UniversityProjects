

namespace DataExporterTemplateMethod
{
    public class DatabaseDataExporter : DataExporter
    {
        protected override void ConnectToDataSource()
        {
            Console.WriteLine("DatabaseDataExporter: Connecting to the data source...");
        }

        protected override void ExtractData()
        {
            Console.WriteLine("DatabaseDataExporter: Extracting the data...");
        }

        protected override void LoadDataToDestination()
        {
            Console.WriteLine("DatabaseDataExporter: Loading data to the destination...");
        }

        protected override void TransformData()
        {
            Console.WriteLine("DatabaseDataExporter: Transforming data...");
        }
    }
}
