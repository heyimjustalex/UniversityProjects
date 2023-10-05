using System;
using System.Collections.Generic;
using System.Linq;

namespace CardGame
{
    class Deck
    {
        List<Card> _cards;
        private List<Card> cards { get => _cards; set => _cards = value; }

        public Deck(List<Card> cards)
        {
            _cards = cards;
        }

        public void addCardToDeck(Card card)
        {
            _cards.Add(card);
        }

        public void printDeck()
        {
            Console.WriteLine("Deck looks like this:");
            int index = 0;
            foreach (Card card in _cards)
            {
                Console.WriteLine(index.ToString() + ". " + card.color + "->" + card.value.ToString());
                index++;
            }
            Console.WriteLine();
        }

        public void dealCardsToPlayer(Player player, int numberOfCards)
        {
            if (_cards.Count() < numberOfCards)
            {
                throw new Exception("Not enough cards in the deck");
            }

            for (int i = 0; i < numberOfCards; i++)
            {
                Card tempCard = new Card(_cards[0].color, _cards[0].value);
                player.addCard(tempCard);
                _cards.RemoveAt(0);
            }
        }
    }

    

}