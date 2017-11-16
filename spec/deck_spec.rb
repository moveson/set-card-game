require_relative '../lib/deck'

RSpec.describe Deck do
  describe '#make' do
    it 'returns an array of 81 unique cards' do
      deck = Deck.new.make
      expect(deck.size).to eq(81)
      expect(deck.uniq.size).to eq(81)
      expect(deck.all? { |card| card.is_a?(Card) }).to eq(true)
    end

    it 'randomizes the deck each time is is produced' do
      deck_1 = Deck.new.make
      deck_2 = Deck.new.make
      expect(deck_1).not_to eq(deck_2)
    end
  end
end
