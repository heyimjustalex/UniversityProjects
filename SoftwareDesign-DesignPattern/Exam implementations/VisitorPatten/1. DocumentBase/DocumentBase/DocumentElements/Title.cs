
namespace DocumentBase.DocumentElements
{
    public class Title : IDocumentElement
    {
        string Content;
        public Title(string content) 
        {
            Content = content;
        }
        public void Print()
        {
            Console.WriteLine($"Title with content: {Content}");
        }     
    }
}
