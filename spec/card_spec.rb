require_relative '../lib/card'

RSpec.describe Card do
  describe '#initialize' do
    it 'initializes when given proper arguments' do
      expect { Card.new('R', '1', 'E', 'S') }.not_to raise_error
    end

    it 'raises an error when given a color that does not exist' do
      expect { Card.new('A', '1', 'E', 'S') }.to raise_error(ArgumentError)
    end

    it 'raises an error when given a number that does not exist' do
      expect { Card.new('R', '0', 'E', 'S') }.to raise_error(ArgumentError)
    end

    it 'raises an error when given a shading that does not exist' do
      expect { Card.new('R', '1', 'Z', 'S') }.to raise_error(ArgumentError)
    end

    it 'raises an error when given a shape that does not exist' do
      expect { Card.new('R', '1', 'E', '82') }.to raise_error(ArgumentError)
    end
  end

  describe '#to_s' do
    it 'returns a string with color, number, shading, and shape' do
      card = Card.new('R', '1', 'E', 'S')
      expect(card.to_s).to eq('R1ES')
    end
  end

  describe '#==' do
    it 'equates two cards with identical attributes' do
      card_1 = Card.new('R', '1', 'E', 'S')
      card_2 = Card.new('R', '1', 'E', 'S')
      expect(card_1).to eq(card_2)
    end

    it 'does not equate cards when the color is different' do
      card_1 = Card.new('R', '1', 'E', 'S')
      card_2 = Card.new('G', '1', 'E', 'S')
      expect(card_1).not_to eq(card_2)
    end
  end
end
