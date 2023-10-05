
using DocumentBase.DocumentElements;

namespace DocumentBase
{
    class Program
    {
        public static void Main(string[] args)
        {
            Document document = new Document("SampleDocument.txt");
            Title title = new Title("Sample Title");
            Paragraph paragraph = new Paragraph("This is a sample paragraph");
            Image image = new Image("./image.png", "This is an Image caption", 200, 200);

            document.AddElement(title);
            document.AddElement(paragraph); 
            document.AddElement(image);

            document.PrintFormattedDocument();

        }
    }
}
