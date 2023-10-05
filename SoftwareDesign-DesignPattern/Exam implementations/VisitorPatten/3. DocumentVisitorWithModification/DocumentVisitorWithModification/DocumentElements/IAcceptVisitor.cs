using DocumentVisitorWithoutModification.Visitors;

namespace DocumentVisitorWithModification.DocumentElements
{
    public interface IAcceptVisitor
    {
        public void Accept (IVisitDocumentElement visitor);
    }
}
