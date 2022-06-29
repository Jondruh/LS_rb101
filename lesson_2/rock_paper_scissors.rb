require "pry"

VALID_CHOICES = { 1 => "rock",
                  2 => "paper",
                  3 => "scissors",
                  4 => "spock",
                  5 => "lizard" }

# Win table keys correspond to valid choice keys
WIN_TABLE = { 1 => [3, 5],
              2 => [1, 4],
              3 => [2, 5],
              4 => [1, 3],
              5 => [4, 2] }

# Checks if first player's choice beats second players in the win table
def win?(first, second)
  WIN_TABLE[first].include?(second)
end

def score(player, computer, scores)
  scores[:player] += 1 if win?(player, computer)
  scores[:computer] += 1 if win?(computer, player)
end

def display_results(player, computer)
  if win?(player, computer)
    puts "You won!"
  elsif win?(computer, player)
    puts "Computer won!"
  else
    puts "It's a tie!"
  end
end

def prompt(message)
  puts "=> #{message}"
end

# Creates a numbered list of all valid choices
def display_choices
  prompt("Choose one:")
  choice_num = "1"
  VALID_CHOICES.each do |choice|
    puts "#{choice_num}) #{choice[1]}"
    choice_num.succ!
  end
end

loop do
  choice = ""
  score = {player: 0, computer: 0}
  
  loop do
    loop do
      display_choices
      choice = gets.chomp.to_i

      if VALID_CHOICES.key?(choice)
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    computer_choice = rand(1..VALID_CHOICES.size)

    print "You chose: #{VALID_CHOICES[choice]};"
    puts " Computer chose: #{VALID_CHOICES[computer_choice]}"

    display_results(choice, computer_choice)
    score(choice, computer_choice, score)

    puts "The score is player: #{score[:player]} computer: #{score[:computer]}"

    break if score.any? { |key, value| value >= 3 }
  end
  
  puts "The winner is #{score.key(3).to_s}!"
  
  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

puts "Thank you for playing, goodbye!"
