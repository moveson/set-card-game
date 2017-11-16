require_relative '../lib/board'

RSpec.describe Board do
  describe '#initialize' do
    context 'when given an array of cards' do
      let(:cards) { [Card.new('R', '1', 'E', 'S'), Card.new('R', '2', 'E', 'S')] }

      it 'initializes properly' do
        expect { Board.new(cards) }.not_to raise_error
      end
    end

    context 'when cards is not an array' do
      let(:cards) { 'Unicorn' }

      it 'raises an error' do
        expect { Board.new(cards) }.to raise_error(ArgumentError)
      end
    end

    context 'when cards contains elements that are not cards' do
      let(:cards) { [Card.new('R', '1', 'E', 'S'), 92] }

      it 'raises an error' do
        expect { Board.new(cards) }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#to_s' do
    it 'outputs a grid of card strings' do
      cards = [Card.new('R', '1', 'E', 'S'), Card.new('R', '2', 'E', 'S'), Card.new('R', '3', 'E', 'S'),
               Card.new('G', '1', 'E', 'S'), Card.new('G', '2', 'E', 'S'), Card.new('G', '3', 'E', 'S')]
      expected = <<~OUTPUT
R1ES R2ES R3ES
G1ES G2ES G3ES
      OUTPUT

      board = Board.new(cards)
      expect(board.to_s).to eq(expected)
    end
  end
end
