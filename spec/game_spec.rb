# spec :game_spec.rb
require './lib/game.rb'

RSpec.describe Game do
  let(:board) { ['X', ' ', ' ', ' ', ' ', 'O', ' ', ' ', ' '] }
  let(:p1_won) { ['X', ' ', ' ', ' ', 'X', 'O', 'O', ' ', 'X'] }
  let(:p2_won) { ['X', 'X', 'O', ' ', 'X', 'O', ' ', ' ', 'O'] }
  let(:drawn) { %w[X O O O X X X X O] }

  describe '.valid?' do
    context 'Return true if the number is between the range of 1 to 9' do
      it { expect(Game.valid?(5)).to eq(true) }
    end
    context 'Return false if the number is not between the range 1 to 9 or is not an integer' do
      it { expect(Game.valid?(15)).to eq(false) }
      it { expect(Game.valid?('A')).to eq(false) }
    end
  end

  describe '.possible?' do
    context 'Return true if the board[move] is not already filled with X or O' do
      it { expect(Game.possible?(board, 3)).to eq(true) }
    end
    context 'Return false if the board[move] is already filled' do
      it { expect(Game.possible?(board, 1)).to eq(false) }
    end
  end

  describe '.winner?' do
    context 'Return 1 if the Player One won the match' do
      it { expect(Game.winner?(p1_won)).to eq(1) }
    end
    context 'Return 2 if the Player Two won the match' do
      it { expect(Game.winner?(p2_won)).to eq(2) }
    end
    context 'Return 0 if there is no winner of the match. Ps: It might be early of the game of game over' do
      it { expect(Game.winner?(board)).to eq(0) }
      it { expect(Game.winner?(drawn)).to eq(0) }
    end
  end
end
