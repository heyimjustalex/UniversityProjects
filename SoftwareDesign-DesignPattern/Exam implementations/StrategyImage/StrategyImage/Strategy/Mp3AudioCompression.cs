using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StrategyImage.Strategy
{
    class Mp3AudioCompression : IAudioCompressionStrategy
    {
        public void Compress(string filePath)
        {
            Console.WriteLine($"Mp3 audio compression of this -> {filePath}");
        }
    }
}
