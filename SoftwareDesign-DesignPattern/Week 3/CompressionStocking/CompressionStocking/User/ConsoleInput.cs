using CompressionStocking.Stocking;
using System;


namespace CompressionStocking.User
{
    internal class ConsoleInput : IUserInput
    {
        public void startButton()
        {
            throw new NotImplementedException();
        }

        public void stopButtton()
        {
            throw new NotImplementedException();
        }

        static void Main(string[] args)
        {          
            ConsoleKeyInfo consoleKeyInfo;
            IInputHandler hdl = new StockingInputHandler();

            Console.WriteLine("Compression Stocking Control User Interface");
            Console.WriteLine("A:   Compress");
            Console.WriteLine("Z:   Decompress");
            Console.WriteLine("ESC: Terminate application");

            do
            {
                consoleKeyInfo = Console.ReadKey(true); // true = do not echo character
              

            } while (consoleKeyInfo.Key != ConsoleKey.Escape);
        }
    }
}
