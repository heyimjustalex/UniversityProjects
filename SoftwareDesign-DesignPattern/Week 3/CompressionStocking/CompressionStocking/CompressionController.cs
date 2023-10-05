using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CompressionStocking
{
    public class StubCompressionController : ICompressionController
    {
        public void Compress()
        {
            Console.WriteLine("StubCompressionController::Compress() called");
        }

        public void Decompress()
        {
            Console.WriteLine("StubCompressionController::Decompress() called");
        }
    }
}
