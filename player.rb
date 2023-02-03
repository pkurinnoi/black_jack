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

  def cards_value  # здесь считаем 2 цифры по сумме очков на картах получаем массив @total_value #TODO Надо обработать момент с двумя/тремя тузами
    @costs = []
    @value_1 = 0
    @value_2 = 0

    @cards.each do |card|
      @costs <<  card.cost
    end

    @costs.each do |value|
      if value.is_a? Array
        @value_1 +=  value[0].to_i
        @value_2 +=  value[1].to_i
      else
        @value_1 += value
        @value_2 += value
      end
    end

    @total_value = [@value_1, @value_2]
    calculator(@total_value)
  end

  def calculator(total_value)
    if total_value.max <= 21
      total_value.max
    elsif total_value.min <= 21
      total_value.min
    end
  end
end
