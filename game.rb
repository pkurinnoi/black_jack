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
    player_cards_view
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

  def player_cards_view
    puts "Your cards:"
    @player.view_cards
    puts "Dealer cards:"
    @dealer.view_cards #TODO убрать в проде
    @dealer.counter.times {puts "***"}
  end
end
