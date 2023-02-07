class Player

  attr_accessor :name, :balance, :cards, :counter

  START_BALANCE = 100
  ACE_COST = 10

  def initialize(name)
    @name = name
    @balance = START_BALANCE

    drop_cards
  end

  def take_card(card)
    @cards << card
    @counter += 1
  end

  def view_cards
    @cards.each {|card| puts "#{card.name}"}
  end

  def calculator
    @costs = []
    @sum = 0

    @cards.each do |card|
      @costs << card.cost
      @sum += card.cost
    end

    if (@costs.include? 1 || @sum <= 11)
      @sum += ACE_COST
    end

    @sum
  end

  def drop_cards
    @counter = 0
    @cards_cost = []
    @cards = []
  end
end
