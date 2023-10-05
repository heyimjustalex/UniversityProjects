


using StrategyAudio;
using StrategyAudio.Strategy;

namespace Program
{
    class Client
    {
        public static void Main()
        {
            IAudioCompressionStrategy strategyMP3 = new Mp3AudioCompression();
            IAudioCompressionStrategy strategyOGG = new OggAudioCompression();

            AudioCompressionProcessor contextProcessor = new AudioCompressionProcessor(strategyMP3);
            contextProcessor.CompressAudio("./files/audio1.wav");

            contextProcessor.SetStrategy(strategyOGG);
            contextProcessor.CompressAudio("./files/audio2.wav");
        }
    }
}