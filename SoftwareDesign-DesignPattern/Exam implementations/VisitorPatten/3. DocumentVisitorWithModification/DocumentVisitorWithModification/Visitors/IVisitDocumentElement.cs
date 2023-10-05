using DocumentVisitorWithoutModification.DocumentElements;

namespace DocumentVisitorWithoutModification.Visitors
{
    public interface IVisitDocumentElement
    {
        void Visit(Paragraph paragraph);
        void Visit(Title title);
        void Visit(Image image);

    }
}
