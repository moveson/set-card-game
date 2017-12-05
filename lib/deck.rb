class Deck
  def initialize
    @cards = make
  end

  attr_reader :cards

  def deal(n)
    cards.pop(n)
  end

  private

  def make
    result = []
    Card::COLORS.each do |color|
      Card::NUMBERS.each do |number|
        Card::SHADINGS.each do |shading|
          Card::SHAPES.each do |shape|
            result << Card.new(color, number, shading, shape)
          end
        end
      end
    end
    result.shuffle
  end
end
