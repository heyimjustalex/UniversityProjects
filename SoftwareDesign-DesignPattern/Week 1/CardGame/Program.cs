using System;

namespace CardGame
{
    class Program
    {
        static void Main(string[] args)
        {
            Simulation s = new Simulation();
            s.start();
            Console.Read();
        }
    }
}