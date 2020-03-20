#!/usr/bin/env ruby

require_relative '../lib/player.rb'
require_relative '../lib/game.rb'
require_relative '../lib/board.rb'

board = Board.new
puts 'TIC-TAC-TOE GAME'.center(40)
puts 'Developed by Elbie Moonga and Rafael Nazario'.center(40)
board.print(board.game_board(3))
puts 'Please enter the name of the players'
puts
puts 'Player One:'
player_one_name = gets.chomp
puts 'Player Two:'
player_two_name = gets.chomp

player_one = Player.new(player_one_name)
player_two = Player.new(player_two_name)
players = [player_one, player_two]

puts "Thank you, game is player #{players[0].name} vs #{players[1].name}"
puts ''
puts 'Play Now?'
puts ''
puts 'Type Y for Yes and Type N for No'
option = gets.chomp
game = Game.new(board.game_board(1), players)
game.choose_option(option)

print "\nPlayers' move should correspond to number positions in the board shown above.\n\n"
puts 'e.g if player is X and plays 1, X is placed in position 1'
puts 'e.g if player is O and plays 6, O is placed in position 6'
board.print(board.game_board(2))
puts 'Do you want to continue?'
puts 'Type Y for Yes and Type N for No'
option = gets.chomp
game.choose_option(option)
puts
game.play
