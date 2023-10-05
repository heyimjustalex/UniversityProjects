namespace StrategyAudio.Strategy
{
    class OggAudioCompression : IAudioCompressionStrategy
    {
        public void Compress(string filePath)
        {
            Console.WriteLine($"Ogg audio compression of this -> {filePath}");

        }
    }
}
