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
  puts
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

def display_overall_winner(score)
  puts
  case score.key(5)
  when :dealer
    puts "--- The dealer is the first to five point and the winner! ---"
  when :player
    puts "--- You're the first to five points and the winner! ---"
  end
  puts
end

def display_overall_score(score)
  puts "Player Score: #{score[:player]} Dealer Score: #{score[:dealer]}"
  puts "-------------------------------"
end

# Strips suit from cards and converts them to an array of integers that
# correspond to their value. All aces are set to 11 by default.
# #evaluate_hand decides if an ace should be 11 or 1.
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

# Decides if an ace (11) should be a (1).
# Returns the sum of the hand after that decision.
def evaluate_hand(hand_values)
  loop do
    if hand_values.sum > BUST_SCORE && hand_values.include?(11)
      hand_values[hand_values.index(11)] = 1
    else
      break
    end
  end
  hand_values.sum
end

def update_bust(player)
  player[:bust] = true if player[:score] > BUST_SCORE
end

def update_score(player)
  player[:score] = evaluate_hand(hand_to_value(player[:hand]))
end

def update_round_counter(round_winner, round_counter)
  if round_winner.match?("dealer")
    round_counter[:dealer] += 1
  elsif round_winner.match?("player")
    round_counter[:player] += 1
  end
end

def play_again?
  puts "=> Would you like to play again? (y/n)"
  answer = gets.chomp.downcase

  true if answer == "y"
end

# Game constants
BUST_SCORE = 21
DEALER_CUTOFF = 17

# Main Loop
loop do
  round_counter = { player: 0, dealer: 0 }

  loop do
    # Setup
    player = { bust: false, score: nil, hand: [] }
    dealer = { bust: false, score: nil, hand: [] }

    deck = build_deck
    active_player = player

    deal(deck, player[:hand], 2)
    deal(deck, dealer[:hand], 2)

    update_score(player)
    update_score(dealer)

    # Game loop
    loop do
      system("clear")

      if active_player == player

        display_overall_score(round_counter)
        puts "The dealer's hand is: #{format_hand(dealer[:hand], 1)} and ?"
        puts "Your hand is: #{format_hand(player[:hand])}"
        puts "Your hand is worth: #{player[:score]} points."
        puts

        choice = nil
        loop do
          puts "=> Would you like to hit or stay? ('h' or 's')"
          choice = gets.chomp.downcase
          break if choice == "h" || choice == "s"
          puts "Please enter 'h' or 's'"
        end

      elsif active_player == dealer
        choice = if dealer[:score] > DEALER_CUTOFF
                   "s"
                 else
                   "h"
                 end
      end

      if choice == "h"
        deal(deck, active_player[:hand])
        update_score(active_player)
        break if update_bust(active_player)
      elsif choice == "s" && active_player == dealer
        break
      else
        active_player = dealer
      end
    end

    # Display Results
    system("clear")

    round_winner = winner(player, dealer)
    update_round_counter(round_winner, round_counter)

    display_overall_score(round_counter)

    puts "Your hand: #{format_hand(player[:hand])}. Worth: #{player[:score]}"
    puts "Dealer hand: #{format_hand(dealer[:hand])}. Worth: #{dealer[:score]}"

    display_winner(round_winner)

    break if round_counter.value?(5)

    puts "=> Ready for the next round?"
    gets.chomp
  end

  display_overall_winner(round_counter)

  break if !play_again?
end
