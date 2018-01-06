require_relative 'card'

class Game
  def initialize(player_names)
    @players = player_names.map { |player_name| Player.new(player_name) }
    @deck = make_deck.shuffle
    validate_setup
  end

  private

  attr_reader :players, :deck

  def make_deck
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
    result
  end

  def validate_setup
    raise ArgumentError, 'Players were not provided' if players.nil? || players.size == 0
  end
end