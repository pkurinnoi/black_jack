class Player

  attr_accessor :name, :balance, :cards

  @cards = []

  def initialize(name)
    @name = name
    @balance = 100
  end

  def take_card(card)
    @cards << card
  end

  def open_cards
  end
end
