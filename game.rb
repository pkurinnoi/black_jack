class Game

  GAME_MENU = ['----------------------------',
               '1. Pass',
               '2. Take card',
               '3. Open cards',
               '4. Fold and restart',
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
    validate!

    puts ['----------------------------',
          '!!!!!! NEW ROUND !!!!!!',
          '----------------------------']
    player_start
    dealer_start
    cards_viewer
    puts "----------------------------"
    puts "#{@player.name} have #{@player.calculator} in cards"
    puts "----------------------------"
    first_bet
    game_menu
  end

  def game_menu
    if (@player.cards.length == 3 && @dealer.cards.length == 3)
      puts "----------------------------"
      final
    else
      puts(*GAME_MENU)
      game_menu_item = gets.to_i
      case game_menu_item
      when 1
        puts "----------------------------"
        dealer_round
        cards_viewer
        game_menu
      when 2
        puts "----------------------------"
        if @player.cards.length < 3
          @player.take_card(@deck.take_first)
        else
          puts"You have 3 cards in a hand!"
        end
        puts "----------------------------"
        cards_viewer
        dealer_round
        game_menu
      when 3
        final
      when 4
        @dealer.balance += @bank
        @bank = 0
        game_controller
      end
    end
  end

  def player_start
    @player.drop_cards
    2.times do
      @player.take_card(@deck.take_first) #берем первую карту из колоды
    end
  end

  def dealer_start
    @dealer.drop_cards
    2.times do
      @dealer.take_card(@deck.take_first) #берем первую карту из колоды
    end
  end

  def cards_viewer
    puts "Your cards:"
    @player.view_cards
    puts "Dealer cards:"
    @dealer.counter.times {puts "***"}
  end

  def first_bet
    if (@player.balance >= 10)
      @player.balance=@player.balance - 10
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

  def dealer_round
    if (@dealer.calculator < 17 && @dealer.cards.size < 3)
      @dealer.take_card(@deck.take_first)
    end
  end

  def open_cards
    puts "#{@player.name} have #{@player.calculator} in cards"
    @player.view_cards
    puts "-----------------------"
    puts "#{@dealer.name} have #{@dealer.calculator} in cards"
    @dealer.view_cards
  end

  def final
    open_cards
    win_calculator

    puts ['-----------------------',
           '1. Continue',
          '0. Exit']

    continue = gets.to_i
    if continue == 1
      game_controller
    else
      exit!
    end
  end

  def win_calculator
    if (@dealer.calculator <= 21) && (@player.calculator <=21) # проверка на превышение 21
      if (21 - @player.calculator) < (21 - @dealer.calculator) # у игрока ближе к 21 чем у игрока
        player_wins
      elsif (21 - @player.calculator) > (21 - @dealer.calculator) # у диллера ближе к 21 чем у игрока
        dealer_wins
      elsif @player.calculator == @dealer.calculator # одинаковое количество
        @player.balance += @bank / 2
        @dealer.balance += @bank / 2
        @bank = 0
      end
    elsif @player.calculator <= 21
      player_wins
    else
      dealer_wins
    end
  end

  def player_wins
    puts "******* #{@player.name} wins #{@bank} $! *******"
    @player.balance += @bank
    @bank = 0
  end

  def dealer_wins
    puts "******* #{@player.name} lose! Dealer wins #{@bank} $! *******"
    @dealer.balance += @bank
    @bank = 0
  end

  def validate!
    begin
      raise "Deck is empty" if @deck.deck.length < 4
      raise "Player balance is too low to start game. Balance: #{@player.balance}" if @player.balance < 10
      raise "Dealer balance is too low to start the game. Balance #{@dealer.balance}" if @dealer.balance < 10
    end
  end
end
