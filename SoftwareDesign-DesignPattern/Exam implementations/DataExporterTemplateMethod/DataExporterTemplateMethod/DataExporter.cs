

namespace DataExporterTemplateMethod
{
   public  abstract class DataExporter
    {
        public void ExportData()
        {
            ConnectToDataSource();
            ExtractData();
            TransformData();
            LoadDataToDestination();
            LogExportCompletion();
            FinalizeExport();
            Console.WriteLine("ExportData(): Data export has been completed.");
        }

        // Common methods implemented in the superclass
        private void LogExportCompletion()
        {
            Console.WriteLine("Common methods: Export process completed successfully.");
        }

        private void FinalizeExport()
        {
            Console.WriteLine("Common methods: Finalizing export process");
            // Any additional steps needed for finalization
        }

        // Abstract methods implemented by subclasses
        protected abstract void ConnectToDataSource();
        protected abstract void ExtractData();
        protected abstract void TransformData();
        protected abstract void LoadDataToDestination();
    }

}
