class Player
  def initialize(name)
    @name = name
    @score = 0
  end

  attr_reader :name, :score
end
