class Playcard

  VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
  SUITES = ['+', '<3', '^', '<>']

  attr_accessor :name, :cost

  def initialize(value, suit, cost = 0)
    @value = value.to_s
    @suit = suit
    @cost = cost
    validate!
    @name = @value + @suit
  end

  def validate!
    raise "Wrong value" unless VALUES.include?(@value)
    raise "Wrong suit!" unless SUITES.include?(@suit)
  end
end
