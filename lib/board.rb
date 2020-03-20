class Board
  def initialize; end

  # method returns different boards available for game play
  def game_board(which_board)
    if which_board == 1
      game_board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
    elsif which_board == 2
      instr_board = ['X', ' ', ' ', ' ', ' ', 'O', ' ', ' ', ' ']
    elsif which_board == 3
      logo_board = %w[0 1 2 3 4 5 6 7 8]
    else
      p 'Error'
    end
  end

  # Method used for printing dummy boards
  def print(board)
    puts " #{board[0]}|#{board[1]}|#{board[2]}".center(38)
    puts " #{board[3]}|#{board[4]}|#{board[5]}".center(38)
    puts " #{board[6]}|#{board[7]}|#{board[8]}".center(38)
  end
end
