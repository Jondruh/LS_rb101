def build_deck
  deck = []

  SUITS.each do |suit|
    (2..10).each { |num| deck << { suit: suit.values[0], value: num.to_s } }
    ["J", "Q", "K", "A"].each do |face|
      deck << { suit: suit.values[0], value: face }
    end
  end

  deck
end

def deal(deck, hand, num_of_cards = 1)
  num_of_cards.times do |_|
    hand << deck.shuffle!.shift
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

def hide_cards(hand)
  hand.map.with_index do |card, index|
    if index == 0
      card
    else
      { suit: "?", value: "?" }
    end
  end
end

def display_hand(hand)
  print "╭───╮ " * hand.size

  hand.each_with_index do |card, i|
    puts if i == 0
    print "│  #{card[:suit]}│ "
  end

  hand.each_with_index do |card, i|
    puts if i == 0
    print "│#{card[:value].ljust(3)}│ "
  end

  puts
  print "╰───╯ " * hand.size
  puts
end

def display_table(player, dealer, show_score = true)
  puts "Dealer's hand:"
  if show_score == false
    display_hand(hide_cards(dealer[:hand]))
  else
    display_hand(dealer[:hand])
  end

  puts "Worth: #{dealer[:score]}" if show_score == true
  puts

  puts "Your hand:"
  display_hand(player[:hand])
  puts "Worth: #{player[:score]}"
  puts
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
  puts
end

def display_overall_winner(score)
  case score.key(5)
  when :dealer
    puts "--- The dealer is the first to five point and the winner! ---"
  when :player
    puts "--- You're the first to five points and the winner! ---"
  end
  puts
end

def display_stats(score)
  puts "Player Score: #{score[:player]} - Dealer Score: " \
       "#{score[:dealer]} - Bust is #{BUST}"
  puts "----------------------------------------------"
end

# Strips suit from cards and converts them to an array of integers that
# correspond to their value. All aces are set to 11 by default.
# #evaluate_hand decides if an ace should be 11 or 1.
def hand_to_value(hand)
  hand.map do |card|
    if (2..10).include?(card[:value].to_i)
      card[:value].to_i
    elsif ["J", "Q", "K"].include?(card[:value])
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
    if hand_values.sum > BUST && hand_values.include?(11)
      hand_values[hand_values.index(11)] = 1
    else
      break
    end
  end
  hand_values.sum
end

def update_bust(player)
  player[:bust] = true if player[:score] > BUST
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
BUST = 21
DEALER_CUTOFF = 17
SUITS = [{ spades: "\u2660" },
         { hearts: "\u2665" },
         { diamonds: "\u2666" },
         { clubs: "\u2663" }]

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

        display_stats(round_counter)

        display_table(player, dealer, false)

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

    display_stats(round_counter)

    display_table(player, dealer)

    display_winner(round_winner)

    break if round_counter.value?(5)

    puts "=> Press enter to go to the next round."
    gets.chomp
  end

  display_overall_winner(round_counter)

  break if !play_again?
end
