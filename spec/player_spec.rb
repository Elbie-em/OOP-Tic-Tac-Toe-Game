#spec :game_spec.rb
require './lib/player.rb'

RSpec.describe Player do 
  let(:count) {0}
  describe '#update_wins' do 
    context 'Once it is called, increment count by one' do
      p = Player.new('Player_One')
      it {expect(p.update_wins).to eq(p.count)}
    end
  end
end
