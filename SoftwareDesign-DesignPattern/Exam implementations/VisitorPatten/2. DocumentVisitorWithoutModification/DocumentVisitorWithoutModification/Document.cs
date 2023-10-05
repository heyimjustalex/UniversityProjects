using DocumentVisitorWithoutModification.DocumentElements;
using DocumentVisitorWithoutModification.Visitors;

namespace DocumentVisitorWithoutModification
{
    internal class Document
    {
        public string Name { get; set; }
        public List<IDocumentElement> Elements { get; }


        public Document(string name) {
        
            Name = name;
            Elements = new List<IDocumentElement>();    
        }   
        public void AddElement(IDocumentElement element) {
            Elements.Add(element);
        }

        public void PrintFormattedDocument()
        {
            Console.WriteLine($"Document name: {Name}\n");
            foreach (IDocumentElement element in Elements)
            {
                element.Print();
                Console.WriteLine("------------------------------------");
            }
        }

        public void ExportAllDocumentElementsToPDF()
        {
            IVisitDocumentElement visitor = new ExportToPdfVisitor();
            foreach (IDocumentElement element in Elements) {

                // there is no way to invoke this way, that's why this implementation is bad
                //  visitor.Visit(element);
              
                // we need to do it like that
                if (element is Title) visitor.Visit((Title)element);
                else if (element is Image) visitor.Visit((Image)element);                
                else if (element is Paragraph) visitor.Visit((Paragraph)element);

                // Pros:
                   // - We did not touch anything in IDocumentElement, Image, Paragraph or Title 
                // Cons:
                   // - Each time we add new DocumentElement we need to edit this function and check type
                   // - Using general type (Interface IVisitDocumentElement) didn't help cause we had to cast it anyway
                   // - We break OCP and probably SRP (we could make seperate class for PDF generation)


            }

        }

    }
}
