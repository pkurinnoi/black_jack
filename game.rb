class Game

  GAME_MENU = ['----------------------------',
               '1. Pass',
               '2. Take card',
               '3. Open cards',
               '----------------------------'].freeze

  def initialize
    puts "Game created!"
    @bank = 0
    @dealer = Player.new('Dealer')
    @deck = Deck.new
    @deck.shuffle
    puts "What is your name?"
    name = gets.chomp()
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
    puts "-------------------------------"
    puts "#{@player.name} have #{@player.first_two_cards_value} in cards"
    puts "#{@dealer.name} have #{@dealer.first_two_cards_value} in cards"
    puts "-------------------------------"
    first_bet
    game_menu
  end

  def game_menu
    puts(*GAME_MENU)
    game_menu_item = gets.to_i
    case game_menu_item
    when 1
      puts "Dealer round"
    when 2
      @player.take_card(@deck.take_first)
      cards_viewer
      puts "#{@player.name} have #{@player.all_cards_value} in cards"
    end
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

  def first_bet
    if (@player.balance >= 10)
      @player.balance=@dealer.balance - 10
      @bank += 10
    else
      game_over
    end

    if (@dealer.balance >= 10)
      @dealer.balance=@dealer.balance - 10
      @bank += 10
    else
      game_over
    end

    puts "Ruby balance is #{@player.balance} $"
    puts "Dealer balance is #{@dealer.balance} $"
    puts "BANK: #{@bank} $"
  end

  def game_over
    puts "You lose!"
  end
end
