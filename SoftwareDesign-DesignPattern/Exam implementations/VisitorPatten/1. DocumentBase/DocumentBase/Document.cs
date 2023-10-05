using DocumentBase.DocumentElements;

namespace DocumentBase
{
    public class Document
    {
        string Name;
        public List<IDocumentElement> Elements { get;}
        
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
    }
}
