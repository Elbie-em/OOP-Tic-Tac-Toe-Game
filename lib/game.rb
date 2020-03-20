class Game
  def initialize(board, players)
    @board = board
    @players = players
  end

  private

  def clear_board(_board)
    board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end

  def player_turn(board, index, player)
    param = ''

    if player === @players[0]
      param = 'X'
    elsif player === @players[1]
      param = 'O'
    end

    case index
    when 0
      board[0] = param
    when 1
      board[1] = param
    when 2
      board[2] = param
    when 3
      board[3] = param
    when 4
      board[4] = param
    when 5
      board[5] = param
    when 6
      board[6] = param
    when 7
      board[7] = param
    when 8
      board[8] = param
    end
  end

  def position_filled?(board, position)
    if board[position] == ' ' || board[position] == '' || board[position].nil?
      false
    else
      true
    end
  end

  def in_range(move)
    loop do
      unless move.between?('0', '8')
        puts 'Please enter a number in range of 0-8'
        move = gets.chomp
      end
      break if move.between?('0', '8')
    end
    move.to_i
  end

  def is_valid(move)
    loop do
      if move.class != Integer || !move.between?(0, 8)
        puts 'Invalid move, enter number in range of 0-8'
        move = gets.chomp
        move = in_range(move)
      end
      break if move.class == Integer && move.between?(0, 8)
    end
    move
  end

  def check_position(board, move, player)
    loop do
      if position_filled?(board, move)
        puts puts "#{player.name}, that position is filled, Try again..."
        move = gets.chomp
        move = in_range(move)
      end
      break unless position_filled?(board, move)
    end
    move
  end

  def won(board)
    p1_move = []
    p2_move = []

    first_cmbn = [0, 1, 2]
    second_cmbn = [3, 4, 5]
    third_cmbn = [6, 7, 8]
    fourth_cmbn = [0, 3, 6]
    fifth_cmbn = [1, 4, 7]
    sixth_cmbn = [2, 5, 8]
    seventh_cmbn = [0, 4, 8]
    eighth_cmbn = [2, 4, 6]

    board.each_with_index do |i, index|
      p1_move << index if i == 'X'
      p2_move << index if i == 'O'
    end

    if (first_cmbn - p1_move).empty? || (second_cmbn - p1_move).empty? || (third_cmbn - p1_move).empty? || (fourth_cmbn - p1_move).empty? || (fifth_cmbn - p1_move).empty? || (sixth_cmbn - p1_move).empty? || (seventh_cmbn - p1_move).empty? || (eighth_cmbn - p1_move).empty?
      1
    elsif (first_cmbn - p2_move).empty? || (second_cmbn - p2_move).empty? || (third_cmbn - p2_move).empty? || (fourth_cmbn - p2_move).empty? || (fifth_cmbn - p2_move).empty? || (sixth_cmbn - p2_move).empty? || (seventh_cmbn - p2_move).empty? || (eighth_cmbn - p2_move).empty?
      2
    else
      0
    end
  end

  public

  def choose_option(option)
    loop do
      option.capitalize!
      if option === 'Y'
        count = 0
        print 'Loading'
        while count < 10
          print '.'
          count += 1
          sleep(0.1)
        end
        break
      elsif option === 'N'
        p 'Thank you. See you next time.'
        exit
      else
        p 'Wrong option! Please select Y or N.'
        option = gets.chomp
      end
      break if option === 'Y'
    end
  end

  def print_game_board
    puts " #{@board[0]}|#{@board[1]}|#{@board[2]}".center(38)
    puts " #{@board[3]}|#{@board[4]}|#{@board[5]}".center(38)
    puts " #{@board[6]}|#{@board[7]}|#{@board[8]}".center(38)
  end

  def play
    loop do
      @board = clear_board(@board)
      print_game_board
      count = 0
      loop do
        p "#{@players[0].name}'s move"
        p1_move = gets.chomp
        # check if move in range
        p1_move = in_range(p1_move)
        # check if move is invalid
        is_valid(p1_move)
        # check if board position is taken
        p1_move = check_position(@board, p1_move, @players[0])
        # place X
        player_turn(@board, p1_move, @players[0])
        print_game_board
        count += 1
        break if won(@board) == 1 || count == 9

        # PLAYER TWO TURN
        p "#{@players[1].name}'s move"
        p2_move = gets.chomp
        p2_move = in_range(p2_move)
        # check if move is invalid
        is_valid(p2_move)
        # check if board position is taken
        p2_move = check_position(@board, p2_move, @players[1])
        # place X
        player_turn(@board, p2_move, @players[1])
        print_game_board
        count += 1
        break if won(@board) == 2 || count == 9
      end

      case won(@board)
      when 1
        p "#{@players[0].name} has won"
        puts
        print_game_board
      when 2
        p "#{@players[1].name} has won"
        puts
        print_game_board
      when 0
        p 'Match draw!'
        puts
        print_game_board
      end

      puts 'Do you want to play another round?'
      continue_option = gets.chomp
      choose_option(continue_option)
      puts
    end
  end
end
