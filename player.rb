class Player

  attr_accessor :name, :balance, :cards, :counter

  START_BALANCE = 100
  ACE_COST_MIN = 1
  ACE_COST_MAX = 11

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

    if @costs.include? ACE_COST_MIN || @sum <= ACE_COST_MAX
      @sum += (ACE_COST_MAX - ACE_COST_MIN)
    end

    @sum
  end

  def drop_cards
    @counter = 0
    @cards_cost = []
    @cards = []
  end
end
