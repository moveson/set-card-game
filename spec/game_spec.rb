require_relative '../lib/game'
require_relative '../lib/player'

RSpec.describe Game do

  describe '#initialize' do
    subject { Game.new(player_names) }
    let(:player_name_1) { 'Jaroldeen' }
    let(:player_name_2) { 'Rachel' }

    context 'when given an array of player names' do
      let(:player_names) { [player_name_1, player_name_2] }

      it 'creates a new game' do
        expect { subject }.not_to raise_error
      end

      it 'builds new Player objects for each name passed' do
        expect(subject.send(:players).size).to eq(2)
        expect(subject.send(:players)).to all be_a(Player)
        expect(subject.send(:players).map(&:score)).to all eq(0)
        expect(subject.send(:players).map(&:name)).to match_array(player_names)
      end

      it 'builds a shuffled deck of 81 unique cards' do
        expect(subject.send(:deck).uniq.size).to eq(81)
        game_2 = Game.new(player_names)
        expect(subject.send(:deck)).not_to eq(game_2.send(:deck))
      end
    end

    context 'when given no players' do
      let(:players) { [] }

      it 'raises an error' do
        expect { subject }.to raise_error
      end
    end
  end
end
