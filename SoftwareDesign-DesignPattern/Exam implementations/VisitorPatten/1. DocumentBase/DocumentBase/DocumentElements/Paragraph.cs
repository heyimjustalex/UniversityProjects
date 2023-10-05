
namespace DocumentBase.DocumentElements
{
    public class Paragraph : IDocumentElement
    {
        string Content;

        public Paragraph(string content)
        {
            Content = content;
        }
        public void Print()
        {
            Console.WriteLine($"Paragraph with content: {Content}");
        }  
    }
}
