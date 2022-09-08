# TODO
#   -larger board?

WINNING_POSITIONS = [[1, 4, 7],
                     [2, 5, 8],
                     [3, 6, 9],
                     [1, 2, 3],
                     [4, 5, 6],
                     [7, 8, 9],
                     [1, 5, 9],
                     [3, 5, 7]]

# Takes inputs of player positions and draws the board.
def draw_board(positions)
  positions[:board_positions].each_with_index do |row, index|
    puts "           |       |       "
    puts "  #{row[0]}   |   #{row[1]}   |   #{row[2]}".center(30)
    puts "           |       |       "
    puts "-------+-------+-------".center(32) if index < 2
  end
  puts
end

def print_score(score)
  system "clear"
  puts "The score is: player: #{score[:player]} computer: #{score[:computer]}"
  puts "First player to 5 points wins!"
  puts
end

# Takes the number that a player selects and returns two numbers back,
# the row (0, 1, 2) and the position (0, 1, 2)
def move_locator(player_move, positions)
  row = nil
  position = nil
  positions[:board_positions].each_with_index do |board_row, r_index|
    board_row.each_with_index do |tile, t_index|
      if tile == player_move
        row = r_index
        position = t_index
      end
    end
  end
  return row, position
end

# Takes the move that is made and adds it to the player positions array,
# then it updates the board with an X or O in place of the number.
def board_update(player, move, positions)
  row, position = move_locator(move, positions)
  case player
  when "X"
    positions[:x_positions] << positions[:board_positions][row][position]
  when "O"
    positions[:o_positions] << positions[:board_positions][row][position]
  end

  positions[:board_positions][row][position] = player
end

# Checks to see if any of the positions matches the WINNING_POSITIONS constant.
# Returns "X", "O", or nil.
def win_check(positions)
  winner = nil

  WINNING_POSITIONS.each do |position|
    if position.all? { |ele| positions[:x_positions].include?(ele) }
      winner = "X"
    end
    if position.all? { |ele| positions[:o_positions].include?(ele) }
      winner = "O"
    end
  end
  winner
end

# Takes the player, and a positions hash, returns a new array
# of WINNING_POSITIONS which are still possible for the given player.
def possible_wins(player, positions)
  case player
  when "O"
    opponent = :x_positions
  when "X"
    opponent = :o_positions
  end

  WINNING_POSITIONS.reject do |array|
    array.map { |tile| positions[opponent].include?(tile) }.any?
  end
end

# Takes an array of WINNING_POSITIONS that are still available for the
# given player (This array produced by #possible_wins). Returns a new
# array with any of the held positions subtracted from the input array.
def paths_to_win(player, positions)
  case player
  when "O"
    current_player = :o_positions
  when "X"
    current_player = :x_positions
  end

  winning_options = possible_wins(player, positions)

  winning_options.map do |array|
    array.reject { |ele| positions[current_player].include?(ele) }
  end
end

# Chooses computer move based on how large each sub-array is after being
# passed through #paths_to_win. Computer will choose to win, to block a win,
# to play on it's shortest win-path that isn't a win, and to play in any
# open position - in that order.
def computer_move(positions, players)
  opponent_win_paths = paths_to_win(players[:player], positions)
  comp_win_paths = paths_to_win(players[:computer], positions)

  if comp_win_paths.map(&:length).any? { |length| length == 1 }
    comp_win_paths.min { |a, b| a.size <=> b.size }.sample

  elsif opponent_win_paths.map(&:length).any? { |length| length == 1 }
    opponent_win_paths.min { |a, b| a.size <=> b.size }.sample

  elsif comp_win_paths.length == 0
    valid_move_list(positions).sample

  else
    comp_win_paths.min { |a, b| a.size <=> b.size }.sample
  end
end

# Returns an array of all open board positions
def valid_move_list(positions)
  valid_positions = []
  positions[:board_positions].each do |array|
    array.each do |position|
      valid_positions << position if position.class == Integer
    end
  end
  valid_positions
end

def valid_input?(player_choice, positions)
  positions[:board_positions].any? do |array|
    array.map { |ele| ele == player_choice }.any?
  end
end

def tie?(positions)
  positions[:board_positions].all? do |array|
    array.map { |ele| ele.class == String }.all?
  end
end

def update_score(winner, players, score)
  score[players.key(winner)] += 1
end

# Sets player and computer to either X or O. Pass the player's token in
# and the method will set the computers token to the other option.
def set_player(player_tracker, x_or_o)
  player_tracker[:player] = x_or_o
  if x_or_o == "X"
    player_tracker[:computer] = "O"
  elsif x_or_o == "O"
    player_tracker[:computer] = "X"
  end
end

def get_move(players, positions, turn)
  if players[:player] == turn
    puts "You are playing as #{turn}, select one of the numbered tiles to play."
    loop do # input validation loop
      player_input = gets.chomp.to_i
      return player_input if valid_input?(player_input, positions)
      puts "Please select a number from the open board positions."
    end
  elsif players[:computer] == turn
    computer_move(positions, players)
  end
end

def ready_prompt
  puts "Ready for the next round?"
  gets
end

def first_to_five?(score)
  true if score.key(5)
end

loop do # Main Loop
  # Setup
  score = { player: 0, computer: 0 }
  players = { player: "", computer: "" }

  loop do # Setting who plays as X and O
    system("clear")
    puts "Welcome to tic tac toe. X goes first."
    puts "Would you like to play as X or O? (press 'x' or 'o' to choose)"
    puts "Or let the computer decide? (press 'c')"

    answer = gets.chomp.upcase
    if answer == "C"
      set_player(players, ["X", "O"].sample)
      break
    elsif answer == "X" || answer == "O"
      set_player(players, answer)
      break
    end

    puts "Please enter 'x', 'o', or 'c'."
  end

  loop do # The loop for a single game of tic tac toe
    turn = "X"
    positions = {
      x_positions: [],
      o_positions: [],
      board_positions: [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9]
      ]
    }

    loop do
      print_score(score)
      draw_board(positions)

      move = get_move(players, positions, turn)

      board_update(turn, move, positions)
      print_score(score)
      draw_board(positions)
      turn = "O"

      if win_check(positions)
        update_score(win_check(positions), players, score)
        print_score(score)
        draw_board(positions)
        puts "The winner is #{win_check(positions)}!"
        break if score.key(5)
        ready_prompt
        break
      end

      if tie?(positions)
        puts "It's a tie!"
        ready_prompt
        break
      end

      move = get_move(players, positions, turn)

      board_update(turn, move, positions)
      print_score(score)
      draw_board(positions)
      turn = "X"

      if win_check(positions)
        update_score(win_check(positions), players, score)
        print_score(score)
        draw_board(positions)
        puts "The winner is #{win_check(positions)}!"
        break if score.key(5)
        ready_prompt
        break
      end

      if tie?(positions)
        puts "It's a tie!"
        ready_prompt
        break
      end
    end

    if score.key(5) == :player # if statement checks to see if either player has 5 points
      puts "You Won!"
      break
    elsif score.key(5) == :computer
      puts "You Lost!"
      break
    end
  end

  puts "Would you like to play again? (y or n)"
  answer = gets.chomp.downcase
  break if answer.start_with?("n")
end
