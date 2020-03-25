# spec :board_spec.rb
require './lib/board.rb'

RSpec.describe Board do
  let(:test_board_a) { [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '] }

  describe '.clear_board' do
    context 'Clear the slots in board once called' do
      ts_board = Board.new
      ts_board.board = ['X', 'X', 'X', ' ', 'O', ' ', ' ', ' ', 'O']
      it { expect(ts_board.clear_board).to eq(test_board_a) }
    end
  end
end