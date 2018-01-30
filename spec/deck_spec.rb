require_relative '../lib/deck'

RSpec.describe Deck do

  describe '#cards' do
    it 'returns the cards that are in the deck' do
      deck = Deck.new
      expect(deck.cards.size).to eq(81)
      expect(deck.cards.uniq.size).to eq(81)
      expect(deck.cards.all? {|card| card.is_a?(Card)}).to eq(true)
    end

    it 'randomizes the deck each time is is produced' do
      deck_1 = Deck.new
      deck_2 = Deck.new
      expect(deck_1.cards).not_to eq(deck_2.cards)
    end
  end

  describe '#deal' do
    it 'takes a number of cards out of a deck and returns an array' do
      deck = Deck.new
      expect(deck.deal(3).size).to eq(3)
      expect(deck.deal(3).all? {|card| card.is_a?(Card)}).to eq(true)
      expect(deck.cards.size).to eq(75)
    end
  end

end