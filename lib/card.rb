class Card
  COLORS = %w[R G B]
  NUMBERS = %w[1 2 3]
  SHADINGS = %w[E H F]
  SHAPES = %w[S O D]

  def initialize(color, number, shading, shape)
    @color = color # R, G, B
    @number = number # 1, 2, 3
    @shading = shading # E, H, F
    @shape = shape # S, O, D
    validate_setup
  end

  def to_s
    "#{color}#{number}#{shading}#{shape}"
  end

  def ==(other)
    color == other.color &&
        number == other.number &&
        shading == other.shading &&
        shape == other.shape
  end

  attr_reader :color, :number, :shading, :shape

  private

  def validate_setup
    raise ArgumentError, "Color #{color} is not recognized." unless COLORS.include?(color)
    raise ArgumentError, "Number #{number} is not recognized." unless NUMBERS.include?(number)
    raise ArgumentError, "Shading #{shading} is not recognized." unless SHADINGS.include?(shading)
    raise ArgumentError, "Shape #{shape} is not recognized." unless SHAPES.include?(shape)
  end
end
