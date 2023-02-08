class Game

  GAME_MENU = ['----------------------------',
               '1. Pass',
               '2. Take card',
               '3. Open cards',
               '4. Fold and restart',
               '----------------------------'].freeze

  PLAYERS = 2
  MAX_POINT = 21
  AI_TRESHOLD = 17
  ACE_COST = 10
  MAX_CARDS = 3
  FIRST_HAND = 2
  MIN_BET = 10

  def initialize
    @bank = 0
    @dealer = Player.new('Dealer')
    @deck = Deck.new
    @deck.deck.shuffle!
    get_name
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
    if (@player.cards.length == MAX_CARDS) && (@dealer.cards.length == MAX_CARDS)
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
        if @player.cards.length < MAX_CARDS
          @player.take_card(@deck.take_first)
        else
          puts"You have #{MAX_CARDS} cards in a hand!"
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
      else
        exit!
      end
    end
  end

  def get_name
    puts "What is your name?"
    name = gets.chomp
    @player = Player.new(name)
    puts "Hello, #{@player.name}"
    puts "Your balance is #{@player.balance} $"
    puts "------------------------------------"
  end

  def player_start
    @player.drop_cards
    FIRST_HAND.times do
      @player.take_card(@deck.take_first) #берем первую карту из колоды
    end
  end

  def dealer_start
    @dealer.drop_cards
    FIRST_HAND.times do
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
    @player.balance >= MIN_BET
    @player.balance=@player.balance - MIN_BET
    @bank += MIN_BET

    @dealer.balance >= MIN_BET
    @dealer.balance=@dealer.balance - MIN_BET
    @bank += MIN_BET

    puts "#{@player.name} balance is #{@player.balance} $"
    puts "Dealer balance is #{@dealer.balance} $"
    puts "BANK: #{@bank} $"
  end

  def dealer_round
    if (@dealer.calculator < AI_TRESHOLD) && (@dealer.cards.size < MAX_CARDS)
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
    if (@dealer.calculator <= MAX_POINT) && (@player.calculator <=MAX_POINT) # проверка на превышение MAX_POINT
      if (MAX_POINT - @player.calculator) < (MAX_POINT - @dealer.calculator) # у игрока ближе к MAX_POINT чем у игрока
        player_wins
      elsif (MAX_POINT - @player.calculator) > (MAX_POINT - @dealer.calculator) # у диллера ближе к MAX_POINT чем у игрока
        dealer_wins
      elsif @player.calculator == @dealer.calculator # одинаковое количество
        puts "****** Bank split! ******"
        @player.balance += @bank / PLAYERS
        @dealer.balance += @bank / PLAYERS
        @bank = 0
      end
    elsif @player.calculator <= MAX_POINT
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
      raise "Deck is empty" if @deck.deck.length < MAX_CARDS + 1
      raise "Player balance is too low to start game. Balance: #{@player.balance}" if @player.balance < MIN_BET
      raise "Dealer balance is too low to start the game. Balance #{@dealer.balance}" if @dealer.balance < MIN_BET
    end
  end
end
