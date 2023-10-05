using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using StrategyImage.Strategy;

namespace StrategyAudio
{
    class AudioCompressionProcessor
    {
        IAudioCompressionStrategy strategy;

        public AudioCompressionProcessor(IAudioCompressionStrategy strategy) { 
        
            this.strategy = strategy;
        }

        public void SetStrategy(IAudioCompressionStrategy strategy) {  this.strategy = strategy; }


        public void CompressAudio(string filePath)
        {
            strategy.Compress(filePath);
        }
    }
}
