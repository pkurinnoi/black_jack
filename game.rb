class Game

  def initialize
    puts "Game created!"
    @dealer = Dealer.new
    @deck = Deck.new
    @deck.shuffle
    puts @deck.class
    puts "What is your name?"
    name = gets.to_s
    @player = Player.new(name)
    puts "Hello, #{name}"
    puts "Your balance is #{@player.balance} $"
    round
  end

  def round

  end
end
