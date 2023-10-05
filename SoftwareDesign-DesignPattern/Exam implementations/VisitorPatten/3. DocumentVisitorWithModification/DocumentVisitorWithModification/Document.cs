using DocumentVisitorWithoutModification.DocumentElements;
using DocumentVisitorWithoutModification.Visitors;

namespace DocumentVisitorWithoutModification
{
    internal class Document
    {
        string _name;
        List<IDocumentElement> elements { get;}
        
        public Document(string name) {
        
            _name = name;
            elements = new List<IDocumentElement>();    
        }   
        public void AddElement(IDocumentElement element) {
            elements.Add(element);
        }

        public void PrintFormattedDocument()
        {
            Console.WriteLine($"Document name: {_name}\n");
            foreach (IDocumentElement element in elements)
            {
                element.Print();
                Console.WriteLine("------------------------------------");
            }
        }

        public void ExportAllDocumentElementsToPDF()
        {
            IVisitDocumentElement visitor = new ExportToPdfVisitor();
            foreach (IDocumentElement element in elements) {

                 element.Accept(visitor);

            }

        }

    }
}
