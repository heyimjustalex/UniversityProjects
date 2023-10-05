
using DocumentVisitorWithModification.DocumentElements;
using DocumentVisitorWithoutModification.Visitors;

namespace DocumentVisitorWithoutModification.DocumentElements
{
    public class Paragraph : IDocumentElement, IAcceptVisitor
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
        public void Accept(IVisitDocumentElement visitor)
        {
            visitor.Visit(this);
        }
    }
}
