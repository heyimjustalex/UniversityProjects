
namespace DocumentVisitorWithoutModification.DocumentElements
{
    public class Image : IDocumentElement
    {
        public string Path { get; set; }
        public string Caption { get; set; }
        public int Width { get; set; }
        public int Height { get; set; }

        public Image(string path, string caption, int width, int height)
        {
            Caption = caption;
            Path = path;
            Width = width;
            Height = height;
        }

        public void Print()
        {
            Console.WriteLine($"Image with caption: {Caption}");
        }
    }
}
