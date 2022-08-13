require "pry"

WINNING_POSITIONS = [[1, 4, 8],
                     [2, 5, 8],
                     [3, 6, 9],
                     [1, 2, 3],
                     [4, 5, 6],
                     [7, 8, 9],
                     [1, 5, 9],
                     [3, 5, 7]
]

X_POSITIONS = []

O_POSITIONS = []

BOARD_POSITIONS = [[1, 2, 3], 
                   [4, 5, 6], 
                   [7, 8, 9] 
]

def draw_board(player_positions)
  puts 
  player_positions.each_with_index do |row, index|
    puts "#{row[0]} | #{row[1]} | #{row[2]}".center(30)
    puts "---+---+---".center(30) if index < 2
  end
  puts
end

def move_locator(player_move)
  row = nil 
  position = nil
  BOARD_POSITIONS.each_with_index do |board_row, r_index|
    board_row.each_with_index do |tile, t_index|
      if tile == player_move
        row = r_index
        position = t_index
      end
    end
  end
  return row, position
end

def board_update(player, move)
  row, position = move_locator(move)
  case player
  when "X"
    X_POSITIONS << BOARD_POSITIONS[row][position]
  when "O"
    O_POSITIONS << BOARD_POSITIONS[row][position]
  end
  
  BOARD_POSITIONS[row][position] = player
end

def win_check
  winner = nil

  if X_POSITIONS.size > 2 || O_POSITIONS.size > 2
    WINNING_POSITIONS.each do |position|
      if position.all? { |ele| X_POSITIONS.include?(ele) }
        winner = "X"
      end
      if position.all? { |ele| O_POSITIONS.include?(ele) }
        winner = "O"
      end
    end
  end
  winner
end

def computer_move
  valid_move_list.sample
end

def valid_move_list
  valid_positions = []
  BOARD_POSITIONS.each do |array|
    array.each do |position|
      valid_positions << position if position.class == Integer 
    end
  end
  valid_positions
end

# Setup
draw_board(BOARD_POSITIONS)

# Main Loop
loop do

  puts
  puts "You are player \"X\", please select one of the numbered tiles to play on"
  
  player_input = gets.chomp.to_i
  board_update("X", player_input)
  draw_board(BOARD_POSITIONS)
  if win_check
    puts "THE WINNER IS #{win_check}!!!!"
    break
  end

  board_update("O", computer_move)
  draw_board(BOARD_POSITIONS)
  if win_check
    puts "THE WINNER IS #{win_check}!!!!"
    break
  end
end
