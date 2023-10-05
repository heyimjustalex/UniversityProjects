using System;
using System.Collections.Generic;

namespace CardGame
{
    static class Colors
    {
        public static List<string> _avaliableColors;
        public static Dictionary<string, int> _multipliers;

        // EX 5
        static Colors()
        {
            _avaliableColors = new List<string> { "red", "blue", "green", "yellow", "gold" };
            _multipliers = new Dictionary<string, int>();
            int i = 0;
            foreach (string color in _avaliableColors)
            {
                _multipliers.Add(color, i + 1);
                i++;
            }
        }

        public static int getMultiplierOfColor(string colorName)
        {
            try
            {
                return _multipliers[colorName];
            }
            catch
            {
                Console.WriteLine("There is no such color in the avaliable colors!\n");
                throw;
            }
        }
    }
}
