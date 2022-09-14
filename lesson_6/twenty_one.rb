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

def winner(player, dealer)
  if player[:bust]
    :dealer_by_bust 
  elsif dealer[:bust]
    :player_by_bust
  elsif player[:score] > dealer[:score]
    :player
  elsif dealer[:score] > player[:score]
    :dealer
  else
    :tie
  end
end

def display_winner(winner)
  case winner
  when :dealer
    puts "The Dealer won!"
  when :dealer_by_bust
    puts "You went bust, the Dealer won!"
  when :player
    puts "You won!"
  when :player_by_bust
    puts "The dealer went bust, you won!"
  when :tie
    puts "It's a tie!"
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

def set_score(player)
  player[:score] = evaluate_hand(hand_to_value(player[:hand]))
end

def stop_playing?
  puts "Would you like to play again? (y/n)"
  answer = gets.chomp.downcase

  true if answer == "y"
end

loop do
  # Setup
  player = {bust: false, score: nil, hand: []}
  dealer = {bust: false, score: nil, hand: []}
          

  deck = build_deck
  active_player = player

  deal(deck, player[:hand], 2)
  deal(deck, dealer[:hand], 2)

  set_score(player)
  set_score(dealer)

  # Game loop
  loop do
    system("clear")

    if active_player == player

      puts "The dealers hand is: " + format_hand(dealer[:hand], 1) + " and a second hidden card"
      puts "Your hand is: " + format_hand(player[:hand])
      puts "Your hand is worth: #{player[:score]} points."

      choice = nil
      loop do
        puts "Would you like to hit or stay? ('h' or 's')"
        choice = gets.chomp.downcase
        break if choice == "h" || choice == "s"
        puts "Please enter 'h' or 's'"
      end

    elsif active_player == dealer
      if dealer[:score] > 16
        choice = "s"
      else
        choice = "h"
      end
    end

    if choice == "h"
      deal(deck, active_player[:hand])
      set_score(active_player)
      break if set_bust(active_player)
    elsif choice == "s" && active_player == dealer
      break
    else
      active_player = dealer
    end
  end

  # Display Results and play again
  system("clear")

  puts "Your hand: " + format_hand(player[:hand]) + ". Worth: #{player[:score]}"
  puts "Dealer's hand: " + format_hand(dealer[:hand]) + ". Worth: #{dealer[:score]}"
  display_winner(winner(player, dealer))

  break if stop_playing?
end
