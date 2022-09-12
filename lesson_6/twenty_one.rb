# PROCESS
#   Game similar to blackjack
#   Rules
#     - standard 52 card deck
#     - goal is to get as close to 21 as possible without going over
#     - if you go over it's a "bust" - you lose.
#     - there are two players, the dealer and the "player"
#       - each are dealt 2 card initially
#       - the player can see both of their cards but only 1 of the dealers
#     - On the player's turn they can hit or stay. Hitting means drawing a card.
#       - the player can hit as many times as they want, if they go over 21 they
#         bust and lose.
#       - if the player stays then it's the dealers turn
#     - The dealer has the same choices as the player but follows strict rules
#       - if the dealer is less than 17 they will hit. if they go above 21 the
#         player wins.
#       - if the dealer is above or equal to 17 they will stay and both hands
#         will be revealed and compared. They player with the higher number of
#         points wins.
#     - Card Values:
#       2-10              = face value
#       jack, queen, kind = 10
#       ace               = 1 or 11
#         - ace will be 11 unless it puts you over 21 in which case it will be 1
#         - you can have more than one ace in your hand, if one of the aces can
#         be 11 it will be, leaving the others to be 1's.
#       
# EXAMPLES
#
# DATA
#   We will be representing a deck of cards where each card is tied to a
#   integer value.
#   We can evaluate the value seperately from the data, and as the ace's value
#   changes we may want to do it on the fly.
#     Hash might look like {diamonds: [ace, 2, 3, 4, 5...], spades: [ace, 2...] ... etc}
#     Array using notation to set the suit [Ac, As, Ah, Ad, 2c, 2s, 2h, 2d....]
#       -seems easier to pull cards from a big ol' array
#     Nested array?
#
# ALGORITHM
#   INITIALIZE GAME
#     -build deck
#      - for each suit
#        put 2..10 plus suit notation in array
#        put face card and ace plus suit notation in array
#     -deal cards
#       -assign each player a hand and populate it
#      
#   START PLAYER LOOP
#     -display player hand and one card from dealer hand
#     -run this loop until they bust or stay
#     -evaluate hand and display total value of hand
#     -ask if hit or stay
#     -if hit
#       -choose a random card that hasn't been dealt
#     -display total value of hand
#     -if bust LOSE
#     -else
#       ask if hit or stay
#       
#   START DEALER LOOP
#     -run this loop until they bust or stay
#     -if over 16 stay
#     -else hit until over 16 or bust
#     
#   EVALUATE HANDS
#     -compare each players hand value and determine winner
#     
#   DISPLAY WINNER
#
# CODE

require "pry"

def build_deck
  deck = []
  suits = ["d", "h", "c", "s"]

  suits.each do |suit|
    (2..10).each { |num| deck << num.to_s + suit }
    ["J", "Q", "K", "A"].each { |face| deck << face + suit }
  end

  deck
end

def deal(deck, hand, num_of_cards = 1)
  num_of_cards.times do |_|
    hand << deck.shuffle!.shift
  end
end

def format_hand(hand, hide = 0)
  if hide == 0
    hand.join(', ')
  elsif hide == 1
    hand[0]
  end
end

def winner(player_hand, dealer_hand)
  player_value = evaluate_hand(hand_to_value(player_hand))
  dealer_value = evaluate_hand(hand_to_value(dealer_hand))

  if bust?(player_hand)
    winner = "Dealer"
  elsif bust?(dealer_hand)
    winner = "Player" 
  elsif player_value > dealer_value
    winner = "Player"
  elsif dealer_value > player_value
    winner = "Dealer"
  else
    winner = "Tie"
  end
end

def bust?(hand)
  evaluate_hand(hand_to_value(hand)) > 21
end

# Strips suit from cards and converts them to an array of integer that correspond to their value.
# All aces are set to 11 by default. #evaluate_hand decides if an ace should be 11 or 1.
def hand_to_value(hand)
  hand.map do |card|
      if (2..10).include?(card.chop.to_i)
        card.chop.to_i
      elsif ["J", "Q", "K"].include?(card.chop)
        10
      else
        11
      end
  end
end

# Decides if an ace (11) should be a (1). Returns the sum of the hand after that decision.
def evaluate_hand(hand_values)
  loop do
    if hand_values.sum > 21 && hand_values.include?(11)
      hand_values[hand_values.index(11)] = 1
    else
      break
    end
  end
  hand_values.sum
end

# Setup
dealers_hand = []
players_hand = []
deck = build_deck

deal(deck, players_hand, 2)
deal(deck, dealers_hand, 2)

# Players turn
loop do
  system("clear")
  puts "The dealers hand is: " + format_hand(dealers_hand, 1) + " and a second hidden card"
  puts "Your hand is: " + format_hand(players_hand)
  puts "Your hand is worth: #{evaluate_hand(hand_to_value(players_hand))} points."
  answer = nil
  loop do
    puts "Would you like to hit or stay? ('h' or 's')"
    answer = gets.chomp.downcase
    break if answer == "h" || answer == "s"
    puts "Please enter 'h' or 's'"
  end

  if answer == "h"
    deal(deck, players_hand)
    if bust?(players_hand)
      puts "You went bust!"
      break
    end
  elsif answer == "s"
    break
  end
end

# Dealer turn

loop do
  break if bust?(players_hand)
  
  if bust?(dealers_hand)
    puts "Dealer went bust!"
    break
  elsif evaluate_hand(hand_to_value(dealers_hand)) > 16
    break
  else
    deal(deck, dealers_hand)
  end
end

# Display Results and play again
puts "Your hand: " + format_hand(players_hand) + " worth: #{evaluate_hand(hand_to_value(players_hand))}"
puts "Dealers hand: " + format_hand(dealers_hand) + " worth: #{evaluate_hand(hand_to_value(dealers_hand))}"
puts "The winner is: #{winner(players_hand, dealers_hand)}"
