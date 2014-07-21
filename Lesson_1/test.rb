
# create a deck - 52 dards - 13 different types - 4 suits

calc = { "Ace of Clubs" => 1, "2 of Clubs" => 2, "3 of Clubs" => 3, "4 of Clubs" => 4, "5 of Clubs" => 5,
       "6 of Clubs" => 6, "7 of Clubs" => 7, "8 of Clubs" => 8, "9 of Clubs" => 9, "10 of Clubs" => 10,
       "Jack of Clubs" => 10, "Queen of Clubs" => 10, "King of Clubs" => 10,
       "Ace of Diamonds" => 1, "2 of Diamonds" => 2, "3 of Diamonds" => 3, "4 of Diamonds" => 4, "5 of Diamonds" => 5,
       "6 of Diamonds" => 6, "7 of Diamonds" => 7, "8 of Diamonds" => 8, "9 of Diamonds" => 9, "10 of Diamonds" => 10,
       "Jack of Diamonds" => 10, "Queen of Diamonds" => 10, "King of Diamonds" => 10,
       "Ace of Hearts" => 1, "2 of Hearts" => 2, "3 of Hearts" => 3, "4 of Hearts" => 4, "5 of Hearts" => 5,
       "6 of Hearts" => 6, "7 of Hearts" => 7, "8 of Hearts" => 8, "9 of Hearts" => 9, "10 of Hearts" => 10,
       "Jack of Hearts" => 10, "Queen of Hearts" => 10, "King of Hearts" => 10,
       "Ace of Spades" => 1, "2 of Spades" => 2, "3 of Spades" => 3, "4 of Spades" => 4, "5 of Spades" => 5,
       "6 of Spades" => 6, "7 of Spades" => 7, "8 of Spades" => 8, "9 of Spades" => 9, "10 of Spades" => 10,
       "Jack of Spades" => 10, "Queen of Spades" => 10, "King of Spades" => 10
    }
 
deck = ["Ace of Clubs", "2 of Clubs", "3 of Clubs", "4 of Clubs", "5 of Clubs", 
       "6 of Clubs", "7 of Clubs", "8 of Clubs", "9 of Clubs", "10 of Clubs", 
       "Jack of Clubs", "Queen of Clubs", "King of Clubs",
       "Ace of Diamonds", "2 of Diamonds", "3 of Diamonds", "4 of Diamonds", "5 of Diamonds", 
       "6 of Diamonds", "7 of Diamonds", "8 of Diamonds", "9 of Diamonds", "10 of Diamonds", 
       "Jack of Diamonds", "Queen of Diamonds", "King of Diamonds",
       "Ace of Hearts", "2 of Hearts", "3 of Hearts", "4 of Hearts", "5 of Hearts", 
       "6 of Hearts", "7 of Hearts", "8 of Hearts", "9 of Hearts", "10 of Hearts", 
       "Jack of Hearts", "Queen of Hearts", "King of Hearts",
       "Ace of Spades", "2 of Spades", "3 of Spades", "4 of Spades", "5 of Spades", 
       "6 of Spades", "7 of Spades", "8 of Spades", "9 of Spades", "10 of Spades", 
       "Jack of Spades", "Queen of Spades", "King of Spades"
    ]

player_cards = []
dealer_cards = []

player_card_value_min = 0
player_card_value_adj = 0
dealer_card_value_min = 0
dealer_card_value_adj = 0


hit_or_stay = nil

def line_spacing_open
  puts "-------------"
  puts " "
end

def line_spacing_close
  puts " "
  puts "-------------"
end      

# Methods to start the game. Player draws 2 cards. Dealer draws 2 cards.  
# Player sees both of his cards, but only one of dealers'.

def start_drawing(deck, player_cards, player_name, dealer_cards)

  player_cards.push(deck.sample)
  deck.delete(player_cards.last)
  player_cards.push(deck.sample)
  deck.delete(player_cards.last)
  dealer_cards.push(deck.sample)
  deck.delete(dealer_cards.last)
  dealer_cards.push(deck.sample)
  deck.delete(dealer_cards.last)
  
  line_spacing_open
  puts "#{player_name}'s cards are #{player_cards[0]} and #{player_cards[1]}."
  puts "Dealer's cards are #{dealer_cards[0]} and Unknown (face down)."

end

# Method to draw more cards if player decides to hit.
def continue_drawing(deck, player_cards, player_name)

  player_cards.push(deck.sample)
  deck.delete(player_cards.last)
  puts "#{player_name}'s cards are: " + [player_cards].join(" - ") 

end

# Method to draw cards for the dealer.
def dealer_draw(deck, dealer_cards)
  puts "Dealer draws a card."
  dealer_cards.push(deck.sample)
  deck.delete(dealer_cards.last)
  puts "Dealer's cards are: " + [dealer_cards].join(" - ")

end

# game intro msg.
line_spacing_open
puts " Tealeaf Blackjack v1.0"
puts "     By Tae Kim"
line_spacing_close

puts " "
puts "What is your name?"
player_name = gets.chomp
puts " "

system 'clear'

line_spacing_open
puts "Hello, Tae. Are you ready for some Blackjack? Here are your cards."
puts "(Dealer deals cards...)"
line_spacing_close

# starts drawing

start_drawing(deck, player_cards, player_name, dealer_cards)

player_cards.each do |card|  
  player_card_value_min = player_card_value_min + calc[card]
end

# This calculates the player's card worth. Ace counts as 1 by default.
# If the sum is 11 or less and the player has 1+ ace, then the sum increases by 10.
# This has the effect of making an Ace worth 11.
# No need to worry about having 2+ ace cards having 11pts each because this results in 22+points.
if player_card_value_min <= 11 && 
    (player_cards.include?("Ace of Clubs") || 
    player_cards.include?("Ace of Diamonds") ||
    player_cards.include?("Ace of Hearts") ||
    player_cards.include?("Ace of Spades"))
  player_card_value_adj = player_card_value_min + 10
else
  player_card_value_adj = player_card_value_min
end

puts " "
puts "#{player_name}'s cards are worth #{player_card_value_adj}."

#keeps asking player to hit or stay until 21+ or player stays
until player_card_value_adj > 20 || hit_or_stay == "s"

  puts "Hit or Stay? (enter 'h' or 's')"
  hit_or_stay = gets.chomp

  if hit_or_stay == "h"
    puts " "
    puts "#{player_name} likes to live dangerously. #{player_name} chooses to hit!"
    continue_drawing(deck, player_cards, player_name)

    player_card_value_min = player_card_value_min + calc[player_cards.last]

    if player_card_value_min <= 11 && 
        (player_cards.include?("Ace of Clubs") || 
        player_cards.include?("Ace of Diamonds") ||
        player_cards.include?("Ace of Hearts") ||
        player_cards.include?("Ace of Spades"))
      player_card_value_adj = player_card_value_min + 10
    else
      player_card_value_adj = player_card_value_min
    end
    puts " "
    puts "#{player_name}'s cards are worth #{player_card_value_adj}."

  elsif hit_or_stay == "s"
    puts " "
    puts "#{player_name} is scared.  #{player_name} stays."
  end
end

#player status announcement after player turn ends
  
  if player_card_value_adj < 21
    puts " "
    puts "#{player_name}'s cards are worth #{player_card_value_adj}."
  elsif player_card_value_adj == 21
    puts " "
    puts "#{player_name} hit blackjack!"
  elsif player_card_value_adj > 21
    puts " "
    puts "#{player_name} busted!"
    line_spacing_close
  end

# dealer turn

line_spacing_open
puts "It is the dealer's turn now."
puts " "
puts "Dealer's cards are: " +  [dealer_cards].join(" - ")

# dealer points calculation - see above (player's points calc) for the logic.
dealer_cards.each do |card|
  dealer_card_value_min = dealer_card_value_min + calc[card]
end

if dealer_card_value_min <= 11 && 
    (dealer_cards.include?("Ace of Clubs") || 
    dealer_cards.include?("Ace of Diamonds") ||
    dealer_cards.include?("Ace of Hearts") ||
    dealer_cards.include?("Ace of Spades"))
  dealer_card_value_adj = dealer_card_value_min + 10
else
  dealer_card_value_adj = dealer_card_value_min
end

puts " "
puts "Dealer has #{dealer_card_value_adj}."

# dealer draw logic - dealer draws only if player stayed with less than 21 pts and dealer has 16 or lower.
# if player has more than 21, player busts.
# if player has 21, player has blackjack and wins.
# if player stays, then dealer keeps drawing until he has 17+.
if player_card_value_adj < 21
  until dealer_card_value_adj >16
    dealer_draw(deck, dealer_cards)
    dealer_card_value_min = dealer_card_value_min + calc[dealer_cards.last]

    if dealer_card_value_min <= 11 && 
        (dealer_cards.include?("Ace of Clubs") || 
        dealer_cards.include?("Ace of Diamonds") ||
        dealer_cards.include?("Ace of Hearts") ||
        dealer_cards.include?("Ace of Spades"))
      dealer_card_value_adj = dealer_card_value_min + 10
    else
      dealer_card_value_adj = dealer_card_value_min
    end

    puts " "
    puts "Dealer has #{dealer_card_value_adj}."
  end
elsif player_card_value_adj == 21
  puts " "
  puts "Dealer doesn't draw because player has 21."
else
  puts " "
  puts " "  
  puts "Dealer doesn't draw because player busted."
end

# winner declaration

if player_card_value_adj > 21
  line_spacing_open
  puts "#{player_name} busts and loses!"
  line_spacing_close
elsif player_card_value_adj == 21
  line_spacing_open 
  puts "#{player_name} wins with a blackjack!"
  line_spacing_close
elsif (player_card_value_adj < 21) && (dealer_card_value_adj > 21)
  line_spacing_open
  puts "#{player_name} wins because dealer busted."
  line_spacing_close
elsif (player_card_value_adj < 21) && (player_card_value_adj > dealer_card_value_adj)
  line_spacing_open 
  puts "#{player_name} wins."
  line_spacing_close
elsif (player_card_value_adj < 21) && (player_card_value_adj < dealer_card_value_adj)
  line_spacing_open
  puts "#{player_name} loses." 
  line_spacing_close 
else
  line_spacing_open
  puts "It's a tie."
  line_spacing_close
end
