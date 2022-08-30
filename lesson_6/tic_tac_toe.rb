require 'pry'

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
  puts
  positions[:board_positions].each_with_index do |row, index|
    puts "#{row[0]} | #{row[1]} | #{row[2]}".center(30)
    puts "---+---+---".center(30) if index < 2
  end
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

# Takes the player, and a positions hash, returns a modified new array
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

# Takes the array that possible_wins returns and returns a new array that
# subtracts the positions that are already held from each sub-array.
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
# passed through paths_to_win. Computer will choose to win, to block a win,
# to play on it's shortest win-path that isn't a win, and to play in any
# open position - in that order.
def computer_move(positions)
  o_win_paths = paths_to_win("O", positions)
  x_win_paths = paths_to_win("X", positions)

  if o_win_paths.map(&:length).any? { |length| length == 1 }
    o_win_paths.min { |a, b| a.size <=> b.size }.sample

  elsif x_win_paths.map(&:length).any? { |length| length == 1 }
    x_win_paths.min { |a, b| a.size <=> b.size }.sample

  elsif o_win_paths.length == 0
    valid_move_list(positions).sample

  else
    o_win_paths.min { |a, b| a.size <=> b.size }.sample
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

# Setup
positions = {
  x_positions: [],
  o_positions: [],
  board_positions: [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
  ]
}

player_input = nil

draw_board(positions)

# Main Loop
loop do
  puts
  puts "You are player \"X\", select one of the numbered tiles to play on"

  loop do # input validation loop
    player_input = gets.chomp.to_i
    break if valid_input?(player_input, positions)
    puts "Please select a number from the open board positions"
  end

  board_update("X", player_input, positions)
  draw_board(positions)
  if win_check(positions)
    puts "THE WINNER IS #{win_check(positions)}!!!!"
    break
  end

  if tie?(positions)
    puts "IT'S A TIE!"
    break
  end

  board_update("O", computer_move(positions), positions)
  draw_board(positions)
  if win_check(positions)
    puts "THE WINNER IS #{win_check(positions)}!!!!"
    break
  end

  if tie?(positions)
    puts "IT'S A TIE!"
    break
  end
end
