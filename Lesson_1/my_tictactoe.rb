

# 1. initializes board

board = { 1 => ' ', 2 => ' ', 3 => ' ', 4 => ' ', 5 => ' ', 6 => ' ', 7 => ' ', 8 => ' ', 9 => ' '}


# 2. draws board
def draw_board(board)
  system 'clear'
  puts " #{board[1]} | #{board[2]} | #{board[3]} "
  puts "-----------"
  puts " #{board[4]} | #{board[5]} | #{board[6]} "
  puts "-----------"
  puts " #{board[7]} | #{board[8]} | #{board[9]} "
end

def empty_square(board)
	board.select {|k, v| v == ' '}.keys
end
# 3. player picks an empty square

def player_square_pick(board)
  puts "Pick an empty square (1-9)"
  player_pick = gets.chomp.to_i
  until board[player_pick] == ' '
  	puts "That is not an empty square. Please pick an empty square."
  	player_pick = gets.chomp.to_i
  end
  board[player_pick] = 'x'
end

# 4. check for winner

def winner_check(board)
  if (board.values_at(1, 2, 3) == ["x", "x", "x"] || board.values_at(4, 5, 6) == ["x", "x", "x"] || 
  	 board.values_at(7, 8, 9) == ["x", "x", "x"] || board.values_at(1, 4, 7) == ["x", "x", "x"] || 
  	 board.values_at(2, 5, 8) == ["x", "x", "x"] || board.values_at(3, 6, 9) == ["x", "x", "x"] || 
  	 board.values_at(1, 5, 9) == ["x", "x", "x"] || board.values_at(3, 5, 7) == ["x", "x", "x"])
    return "player"
  elsif (board.values_at(1, 2, 3) == ["o", "o", "o"] || board.values_at(4, 5, 6) == ["o", "o", "o"] || 
  	 board.values_at(7, 8, 9) == ["o", "o", "o"] || board.values_at(1, 4, 7) == ["o", "o", "o"] || 
  	 board.values_at(2, 5, 8) == ["o", "o", "o"] || board.values_at(3, 6, 9) == ["o", "o", "o"] || 
  	 board.values_at(1, 5, 9) == ["o", "o", "o"] || board.values_at(3, 5, 7) == ["o", "o", "o"])
    return "computer"
  else
    return nil
  end
end

#  computer picks an empty square

def comp_square_pick(board)
  comp_pick = empty_square(board).sample
  board[comp_pick] = 'o'
end

#  repeat until winner 
until winner_check(board) || empty_square(board).empty?  do
  player_square_pick(board)
  winner_check(board)
  comp_square_pick(board)
  winner_check(board)
  draw_board(board)
end

if winner_check(board)
  puts "#{winner_check(board)}"
else
  puts "tie"
end