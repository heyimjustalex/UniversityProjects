

namespace StrategyAudio.Strategy
{
    class Mp3AudioCompression : IAudioCompressionStrategy
    {
        public void Compress(string filePath)
        {
            Console.WriteLine($"Mp3 audio compression of this -> {filePath}");
        }
    }
}
