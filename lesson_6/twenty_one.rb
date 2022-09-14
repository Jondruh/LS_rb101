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

def winner(players)
  if players[:player][:bust]
    winner = "Dealer"
  elsif players[:dealer][:bust]
    winner = "Player" 
  elsif players[:player][:score] > players[:dealer][:score]
    winner = "Player"
  elsif players[:dealer][:score] > players[:player][:score]
    winner = "Dealer"
  else
    winner = "Tie"
  end
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

def set_bust(player)
  player[:bust] = true if player[:score] > 21
end

def set_score(players_hash)
  players_hash.each do |player, player_stats|
    player_stats[:score] = evaluate_hand(hand_to_value(player_stats[:hand]))
  end
end

# Setup
players = {dealer: {bust: false, score: nil, hand: []},
          player: {bust: false, score: nil, hand: []}}
        

deck = build_deck
active_player = players[:player]

deal(deck, players[:player][:hand], 2)
deal(deck, players[:dealer][:hand], 2)

set_score(players)

# Game loop
loop do
  system("clear")

  if active_player == players[:player]

    puts "The dealers hand is: " + format_hand(players[:dealer][:hand], 1) + " and a second hidden card"
    puts "Your hand is: " + format_hand(players[:player][:hand])
    puts "Your hand is worth: #{players[:player][:score]} points."

    choice = nil
    loop do
      puts "Would you like to hit or stay? ('h' or 's')"
      choice = gets.chomp.downcase
      break if choice == "h" || choice == "s"
      puts "Please enter 'h' or 's'"
    end

  elsif active_player == players[:dealer]
    if players[:dealer][:score] > 16
      choice = "s"
    else
      choice = "h"
    end
  end

  if choice == "h"
    deal(deck, active_player[:hand])
    set_score(players)
    break if set_bust(active_player)
  elsif choice == "s" && active_player == players[:dealer]
    break
  else
    active_player = players[:dealer]
  end
end

# Display Results and play again
system("clear")
if players[:player][:bust]
  puts "You went bust!"
elsif
  players[:dealer][:bust]
  puts "The dealer went bust!"
end
puts "Your hand: " + format_hand(players[:player][:hand]) + " worth: #{players[:player][:score]}"
puts "Dealer's hand: " + format_hand(players[:dealer][:hand]) + " worth: #{players[:dealer][:score]}"
puts "The winner is: #{winner(players)}"
