using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StrategyImage.Strategy
{
    interface IAudioCompressionStrategy
    {
        void Compress(string filePath);
    }
}
