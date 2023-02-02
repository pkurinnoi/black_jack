class Deck

  VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
  SUITS = ['+', '<3', '^', '<>']
  COSTS = {'2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9, '10' => 10, 'J' => 10, 'Q' => 10, 'K' => 10, 'A' => [1, 11]}

  def initialize
    @deck = []

    SUITS.each do |suit|
      VALUES.each do|value|
        cost = COSTS[value]
        playcard = Playcard.new(value, suit, cost)
        @deck << playcard
      end
    end
    puts "New deck with #{@deck.length} cards successfully created!"
  end

  def shuffle
    @deck = @deck.shuffle()
    puts "Deck shuffled!"
  end

  def view
    @deck.each do |card|
      puts card.name
    end
  end
end

