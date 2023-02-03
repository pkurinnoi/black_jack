class Player

  attr_accessor :name, :balance, :cards

  def initialize(name)
    @name = name
    @balance = 100

    @cards = []
  end

  def take_card(card)
    @cards << card
  end

  def view_cards
    @cards.each {|card| puts "#{card.name}"}
  end
end
