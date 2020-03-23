class Game
  def self.valid?(move)
    return move.between?('1', '9') ? true : false
  end

  def self.possible?(board, move)
    return board[move.to_i - 1] != 'X' && board[move.to_i - 1] != 'O' ? true : false
  end

  def self.winner?(board)
    p1_move = []
    p2_move = []

    winning = [ [0, 1, 2],
                [3, 4, 5],
                [6, 7, 8],
                [0, 3, 6],  
                [1, 4, 7],
                [2, 5, 8],
                [0, 4, 8],
                [2, 4, 6]]

    board.each_with_index do |i, index|
      p1_move << index if i == 'X'
      p2_move << index if i == 'O'
    end

    winning.each_with_index do |value, index|
      if (value-p1_move).empty?
        return 1
      elsif (value - p2_move).empty?
        return 2
      end
    end
    0
  end
end