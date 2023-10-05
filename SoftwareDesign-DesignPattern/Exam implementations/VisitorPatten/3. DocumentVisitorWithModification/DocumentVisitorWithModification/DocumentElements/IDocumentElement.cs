

using DocumentVisitorWithModification.DocumentElements;

namespace DocumentVisitorWithoutModification.DocumentElements
{
    public interface IDocumentElement : IAcceptVisitor
    {
        void Print();
    }
}
