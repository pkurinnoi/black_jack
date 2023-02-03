class Game

  def initialize
    puts "Game created!"
    @dealer = Player.new('Dealer')
    @deck = Deck.new
    @deck.shuffle
    puts @deck.class
    puts "What is your name?"
    name = gets.to_s
    @player = Player.new(name = 'Ruby')
    puts "Hello, #{name}"
    puts "Your balance is #{@player.balance} $"
    puts "------------------------------------"
    game_controller
  end

  def game_controller
    player_start
    dealer_start
    cards_viewer
    cards_value(@player)
    cards_value(@dealer)
  end

  def player_start
    2.times do
      @player.take_card(@deck.take_first) #берем первую карту из колоды
      @deck.drop_first       #сбрасываем верхнюю карту из колоды
    end
  end

  def dealer_start
    2.times do
      @dealer.take_card(@deck.take_first) #берем первую карту из колоды
      @deck.drop_first       #сбрасываем верхнюю карту из колоды
    end
  end

  def cards_viewer
    puts "Your cards:"
    @player.view_cards
    puts "Dealer cards:"
    @dealer.view_cards #TODO убрать в проде
    @dealer.counter.times {puts "***"}
  end

  def cards_value(player)  # здесь считаем 2 цифры по сумме очков на картах получаем массив @total_value
    @costs = []
    @value_1 = 0
    @value_2 = 0

    player.cards.each do |card|
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

  end
end
