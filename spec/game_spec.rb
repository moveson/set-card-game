require_relative '../lib/game'
require_relative '../lib/player'

RSpec.describe Game do

  subject { Game.new(player_names) }
  let(:player_name_1) { 'Jaroldeen' }
  let(:player_name_2) { 'Rachel' }
  let(:player_names) { [player_name_1, player_name_2] }

  describe '#initialize' do

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
        expect(subject.send(:deck).uniq.size).to eq(69)
        game_2 = Game.new(player_names)
        expect(subject.send(:deck)).not_to eq(game_2.send(:deck))
      end
    end

    context 'when given no players' do
      let(:player_names) { [] }

      it 'raises an error' do
        expect { subject }.to raise_error ArgumentError
      end
    end
  end

  describe '#deal' do
    it 'takes a given number of cards off a deck' do
      expect(subject.deal(3).size).to eq(3)
      expect(subject.send(:deck).size).to eq(66)
      expect(subject.send(:board).size).to eq(15)
    end
  end
end
