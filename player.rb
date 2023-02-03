class Player

  attr_accessor :name, :balance, :cards, :counter

  def initialize(name)
    @name = name
    @balance = 100

    @counter = 0
    @cards_cost = []
    @cards = []
  end

  def take_card(card)
    @cards << card
    @counter += 1
  end

  def view_cards
    @cards.each {|card| puts "#{card.name}"}
  end

  def first_two_cards_value
    @costs = []
    @total_cost = 0

    @cards.each do |card|
      @costs <<  card.cost
    end

    @costs = @costs.flatten

    if (@costs.max + @costs.sort[-2] > 21)
      @total_cost = @costs.max + @costs.sort[-3]
    else
      @total_cost = @costs.max + @costs.sort[-2]
    end

    @total_cost
  end
end
