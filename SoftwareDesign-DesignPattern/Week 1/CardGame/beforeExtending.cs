using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

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

    class Simulation
    {
        Deck _deck;
        List<Player> _players;
        Game _game;

        public Simulation()
        {    
            this.generateDeck(20);
            _deck.printDeck();    
            this.generatePlayers(4);     
            
            
            _game = new Game(_players,_deck);
          
        }
        public void start()
        {
              _game.start();
       
            
        }

        private void generatePlayers (int numberOfPlayers)
        {   
            _players = new List<Player>(); 
           
            for (int i=0; i < numberOfPlayers; i++)
            {
                 List<Card>  startingCardsForPlayers = new List<Card>();
                Player player = new Player("player" + i.ToString(), startingCardsForPlayers);          
                _players.Add(player);
            }           

        }

        private void generateDeck (int numberOfCards)
        {
            Random rnd = new Random();
            List <Card> listOfGeneratedCards = new List<Card>();
            for (int i = 0; i < numberOfCards; i++)
            {
                int cardValue = rnd.Next() %8 +1;
                int cardColorNumber = rnd.Next()%(Colors._avaliableColors.Count());
                Card card = new Card(Colors._avaliableColors[cardColorNumber],cardValue);
                listOfGeneratedCards.Add(card);
                
            }
            _deck = new Deck(listOfGeneratedCards);
            
        }
        
        public void printDeck()
        {
            Console.WriteLine("Deck looks like this:");
            int index=0;
           foreach (Card card in _deck.cards)
            {   
                Console.WriteLine(index.ToString()+". "+ card.color+"->"+card.value.ToString());
                   index++;
            }
                 Console.WriteLine();
        }
         
       
    }
    
    class Game
    {
        Deck _deck;
        List<Player> _players;

        public Game (List<Player> players, Deck deck)
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
            bool wasException = false;
            int deckLength = _deck.cards.Count();
            for (int i=0;i<deckLength;i++)
            {
                int currPlayerIndex = i % _players.Count();
                try{
                    _deck.dealCardsToPlayer(_players[currPlayerIndex],1)                        ;}
                catch {};
            }
         
        }

        public void showTheWinner()
        {
            if(_players.Count()==0)
            {
                throw new Exception("There are no players! I cannot show the winner!");
            }

            int maxDeckValue = _players[0].getHandValue();
            Player maxPlayer = _players[0];

            foreach(Player player in _players)
            { 
                int playerDeckValue = player.getHandValue();
              
                if(playerDeckValue > maxDeckValue)
                { 
                    maxDeckValue = playerDeckValue;
                     maxPlayer = player;
                 }
            }
            Console.WriteLine("\nThe winner is: " + maxPlayer.name+"\n");
            maxPlayer.printHand();
            Console.WriteLine();
          
    }
         private void printPlayers()
        {
            Console.WriteLine("Players list looks like this:");
            int index=0;
                   Console.WriteLine();
           foreach (Player player in _players)
            {      
                Console.WriteLine(index.ToString()+". "+ player.name);
                Console.WriteLine( player.name +" hand looks like this:\n");

                player.printHand();
                index++;
                Console.WriteLine();
                Console.WriteLine("Hand value: "+player.getHandValue().ToString()+"\n");
            }
            Console.WriteLine();
        }

            
        }

    class Deck
    {
        List<Card> _cards;
        public List<Card> cards { get => _cards; set => _cards = value; }

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
            int index=0;
           foreach (Card card in _cards)
            {   
                Console.WriteLine(index.ToString()+". "+ card.color+"->"+card.value.ToString());
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
            {    Card tempCard = new Card(_cards[0].color,_cards[0].value);
                 player.addCard(tempCard);           
                _cards.RemoveAt(0);
        

            }

        }
    }

   static class Colors
    {       
        public static List<string> _avaliableColors;
        public static Dictionary<string, int> _multipliers;

       static Colors()
        {
            _avaliableColors = new List<string> { "red", "blue", "green", "yellow" };
            _multipliers = new Dictionary<string,int>();
            int i = 0;
            foreach (string color in _avaliableColors)
            {
                _multipliers.Add(color, i + 1);
                i++;
            }
            
        }
           
        

       public static int getMultiplierOfColor(string colorName)
        {
            try{ 
                return _multipliers[colorName];
            }
            catch {
                Console.WriteLine("There is no such color in the avaliable colors!\n");
                throw;
            }
        }    

    }

    class Card {

        string _color;
        int _value;
             
        public Card(string color, int value)
        {
            _color = color;
            _value = value;

        }
        public string color    
        {
            get => _color;
            set => _color = value;
        }

        public int value 
        {
            get => _value;
            set => _value = value;
        }
      
        public string getAllCardProperties()
        {
            return "Color: " + _color + " | Value: " + _value.ToString() + " | (Multiplier: " + Colors.getMultiplierOfColor(_color).ToString()+")";
        }
    }

    class Player
    {
        string _name;
        List<Card> _cards;

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
            int sumOfHand=0;
            foreach (Card card in _cards)
            {
                sumOfHand += card.value;
            }

            return sumOfHand;
        }

        public void addCard(Card card)
        {
            _cards.Add(card);
        }

        public void printHand()
        {
            foreach(Card card in _cards)
            {               
                Console.WriteLine(card.getAllCardProperties());
            }
        }
    }

}