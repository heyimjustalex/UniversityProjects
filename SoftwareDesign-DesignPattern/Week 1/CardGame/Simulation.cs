using System;
using System.Collections.Generic;
using System.Linq;

namespace CardGame
{
    class Simulation
    {
        Deck _deck;
        List<Player> _players;
        Game _game;
        Game _minVariantGame;

        public Simulation()
        {
            this.generateDeck(20);
            _deck.printDeck();
            this.generatePlayers(4);

            _game = new Game(_players, _deck);
            _minVariantGame = new GameLowestVariant(_players, _deck);
        }

        public void start()
        {
            _game.start();
            Console.WriteLine("-----------------------------------------------------");
            Console.WriteLine("\n \n PLAYING NEW LOWEST WINS VARIANT OF THIS GAME ON THE SAME DATA \n \n");
            Console.WriteLine("-----------------------------------------------------");
            _minVariantGame.start();
        }

        private void generatePlayers(int numberOfPlayers)
        {
            _players = new List<Player>();

            for (int i = 0; i < numberOfPlayers; i++)
            {
                List<Card> startingCardsForPlayers = new List<Card>();
                Player player = new Player("player" + i.ToString(), startingCardsForPlayers);
                _players.Add(player);
            }
            _players.Add(new WeakPlayer("weak player", new List<Card>()));
        }

        private void generateDeck(int numberOfCards)
        {
            Random rnd = new Random();
            List<Card> listOfGeneratedCards = new List<Card>();
            for (int i = 0; i < numberOfCards; i++)
            {
                int cardValue = rnd.Next() % 8 + 1;
                int cardColorNumber = rnd.Next() % Colors._avaliableColors.Count();
                Card card = new Card(Colors._avaliableColors[cardColorNumber], cardValue);
                listOfGeneratedCards.Add(card);
            }
            _deck = new Deck(listOfGeneratedCards);
        }

        public void printDeck()
        {
            Console.WriteLine("Deck looks like this:");
            int index = 0;
            foreach (Card card in _deck.cards)
            {
                Console.WriteLine(index.ToString() + ". " + card.color + "->" + card.value.ToString());
                index++;
            }
            Console.WriteLine();
        }
    }
}