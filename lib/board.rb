class Board
  def initialize(cards)
    @cards = cards
    validate_setup
  end

  def to_s
    cards.map { |card| card.to_s }.each_slice(3).map { |slice| slice.join(' ') }.join("\n") + "\n"
  end

  private

  attr_reader :cards

  def validate_setup
    raise ArgumentError, 'Cards must be an Array' unless cards.is_a?(Array)
    raise ArgumentError, 'Cards must contain only Card objects' unless cards.all? { |card| card.is_a?(Card) }
  end
end
