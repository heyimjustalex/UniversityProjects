using System;
using System.Collections.Generic;
using System.Linq;

namespace CardGame
{
    class Player
    {
        protected string _name;
        protected List<Card> _cards;

        public string name
        {
            get => _name;
            set => _name = value;
        }

        public List<Card> cards
        {
            get => _cards;
            set => _cards = value;
        }

        public Player(string name, List<Card> cards)
        {
            _name = name;
            _cards = cards;
        }

        public int getHandValue()
        {
            int sumOfHand = 0;
            foreach (Card card in _cards)
            {
                sumOfHand += card.value;
            }

            return sumOfHand;
        }

        public virtual void addCard(Card card)
        {
            _cards.Add(card);
        }

        public void printHand()
        {
            foreach (Card card in _cards)
            {
                Console.WriteLine(card.getAllCardProperties());
            }
        }
    }

    //EX4 - adding weak player

    class WeakPlayer : Player
    {
        public WeakPlayer(string name, List<Card> cards) : base(name, cards)
        {
        }

        override public void addCard(Card card)
        {
            if (base._cards.Count() >= 3)
            {
                //drop first card
                Console.WriteLine("WEAK PLAYER COMMUNICATE:  I am a weak player who got his 4'th card, so I'm dropping first one\n");
                base._cards.RemoveAt(0);
            }
            base.cards.Add(card);
        }
    }

}