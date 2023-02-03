class Player

  attr_accessor :name, :balance, :cards, :counter

  def initialize(name)
    @name = name
    @balance = 100

    @counter = 0
    @cards = []
  end

  def take_card(card)
    @cards << card
    @counter += 1
  end

  def view_cards
    @cards.each {|card| puts "#{card.name}"}
  end
end
