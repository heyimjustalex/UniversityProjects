
using StrategyAudio.Strategy;

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
