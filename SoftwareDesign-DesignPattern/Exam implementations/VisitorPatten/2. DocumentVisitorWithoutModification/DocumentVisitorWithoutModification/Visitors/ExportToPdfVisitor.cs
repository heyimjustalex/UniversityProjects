using DocumentVisitorWithoutModification.DocumentElements;

namespace DocumentVisitorWithoutModification.Visitors
{
    public class ExportToPdfVisitor : IVisitDocumentElement
    {
        public void Visit(Title title)
        {
            // assume using title in this function
            Console.WriteLine($"Visit Title: Exporting Title to PDF file");
        }
        public void Visit(Paragraph paragraph)
        { 
            // assume using paragraph in this function
            Console.WriteLine($"Visit Paragraph: Exporting Paragraph to PDF file successfull");
        }
        public void Visit(Image image)
        {
            // assume using image in this function
            Console.WriteLine($"Visit Image: Image to PDF file");
        }
    }
}
