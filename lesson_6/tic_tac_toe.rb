require "pry"

WINNING_POSITIONS = [[1, 4, 7],
                     [2, 5, 8],
                     [3, 6, 9],
                     [1, 2, 3],
                     [4, 5, 6],
                     [7, 8, 9],
                     [1, 5, 9],
                     [3, 5, 7]
]


def draw_board(positions)
  puts 
  positions[:board_positions].each_with_index do |row, index|
    puts "#{row[0]} | #{row[1]} | #{row[2]}".center(30)
    puts "---+---+---".center(30) if index < 2
  end
  puts
end

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

def win_check(positions)
  winner = nil

  if positions[:x_positions].size > 2 || positions[:o_positions].size > 2
    WINNING_POSITIONS.each do |position|
      if position.all? { |ele| positions[:x_positions].include?(ele) }
        winner = "X"
      end
      if position.all? { |ele| positions[:o_positions].include?(ele) }
        winner = "O"
      end
    end
  end
  winner
end

def computer_move(positions)
  valid_moves = valid_move_list(positions)
  valid_moves.sample
end

def valid_move_list(positions)
  valid_positions = []
  positions[:board_positions].each do |array|
    array.each do |position|
      valid_positions << position if position.class == Integer 
    end
  end
  valid_positions
end

# Setup
positions = { 
            x_positions: [],
            o_positions: [],
            board_positions: [[1, 2, 3],
                              [4, 5, 6],
                              [7, 8, 9]
                              ]
}

          

draw_board(positions)

# Main Loop
loop do

  puts
  puts "You are player \"X\", please select one of the numbered tiles to play on"
  
  player_input = gets.chomp.to_i
  board_update("X", player_input, positions)
  draw_board(positions)
  if win_check(positions)
    puts "THE WINNER IS #{win_check(positions)}!!!!"
    break
  end

  board_update("O", computer_move(positions), positions)
  draw_board(positions)
  if win_check(positions)
    puts "THE WINNER IS #{win_check(positions)}!!!!"
    break
  end
end
