using System;
using System.Collections.Generic;
using System.Linq;

namespace CardGame
{
    class Game
    {
        protected Deck _deck;
        protected List<Player> _players;

        public Game(List<Player> players, Deck deck)
        {
            _players = players;
            _deck = deck;
        }

        public void start()
        {
            dealCardsToPlayers();
            printPlayers();
            showTheWinner();
        }

        private void dealCardsToPlayers()
        {        
            int deckLength = _deck.cards.Count();
            for (int i = 0; i < deckLength; i++)
            {
                int currPlayerIndex = i % _players.Count();
                try
                {
                    _deck.dealCardsToPlayer(_players[currPlayerIndex], 1);
                }
                catch { };
            }
        }

        public virtual void showTheWinner()
        {
            if (_players.Count() == 0)
            {
                throw new Exception("There are no players! I cannot show the winner!");
            }

            int maxDeckValue = _players[0].getHandValue();
            Player maxPlayer = _players[0];

            foreach (Player player in _players)
            {
                int playerDeckValue = player.getHandValue();

                if (playerDeckValue > maxDeckValue)
                {
                    maxDeckValue = playerDeckValue;
                    maxPlayer = player;
                }
            }
            Console.WriteLine("\nThe winner is: " + maxPlayer.name + "\n");
            maxPlayer.printHand();
            Console.WriteLine();
        }
        private void printPlayers()
        {
            Console.WriteLine("Players list looks like this:");
            int index = 0;
            Console.WriteLine();
            foreach (Player player in _players)
            {
                Console.WriteLine(index.ToString() + ". " + player.name);
                Console.WriteLine(player.name + " hand looks like this:\n");

                player.printHand();
                index++;
                Console.WriteLine();
                Console.WriteLine("Hand value: " + player.getHandValue().ToString() + "\n");
            }
            Console.WriteLine();
        }
    }

    // EX6
    class GameLowestVariant : Game
    {
        public GameLowestVariant(List<Player> players, Deck deck) : base(players, deck) { }

        public override void showTheWinner()
        {
            if (_players.Count() == 0)
            {
                throw new Exception("There are no players! I cannot show the winner!");
            }

            int minDeckValue = _players[0].getHandValue();
            Player minPlayer = _players[0];

            foreach (Player player in _players)
            {
                int playerDeckValue = player.getHandValue();

                if (playerDeckValue < minDeckValue)
                {
                    minDeckValue = playerDeckValue;
                    minPlayer = player;
                }
            }
            Console.WriteLine("\nThe winner is: " + minPlayer.name + "\n");
            minPlayer.printHand();
            Console.WriteLine();
        }
    }
}