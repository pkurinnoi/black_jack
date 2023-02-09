class Deck

  COSTS = {'2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9, '10' => 10, 'J' => 10, 'Q' => 10, 'K' => 10, 'A' => 1}

  attr_reader :deck

  def initialize
    @deck = []

    Playcard::SUITES.each do |suit|
      Playcard::VALUES.each do|value|
        cost = COSTS[value]
        playcard = Playcard.new(value, suit, cost)
        @deck << playcard
      end
    end
  end

  def view
    @deck.each do |card|
      puts card.name
    end
  end

  def take_first
    @deck.pop
  end
end

