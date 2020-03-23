class Board
  attr_accessor :board
  @@logo_board = %w[1 2 3 4 5 6 7 8 9]
  @@instr_board = ['X', ' ', ' ', ' ', ' ', 'O', ' ', ' ', ' ']
  
  def initialize
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end

  def clear_board
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end

  def self.logo
    @@logo_board
  end

  def self.instr
    @@instr_board
  end

  def self.make_move(table, move, mark)
    table[move.to_i - 1] = mark
  end
end
