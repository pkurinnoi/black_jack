class Controller

  MAIN_MENU = ['----------------------------',
               '1. New game',
               '2. Deck menu',
               '0. Exit',
               '----------------------------'].freeze

  DECK_MENU = ['----------------------------',
               '1. New deck',
               '2. Shuffle deck',
               '3. View deck',
               '4. Drop first from deck and take it',
               '----------------------------'].freeze

  def main_menu
    puts '> What you want to do?'
    puts(*MAIN_MENU)
  end

  def main_menu_run(item)
    case item
    when 1
      Game.new
    when 2
      puts '> What you want to do?'
      puts(*DECK_MENU)
      deck_menu(gets.to_i)
    end
  end

  def deck_menu(item)
    case item
    when 1
      if @deck.nil?
        @deck = Deck.new
      else
        puts "Deck already exist!"
      end
    when 2
      @deck.shuffle
    when 3
      @deck.view
    when 4
      card = @deck.take_first
      puts card.name
      @deck.drop_first
    end
  end
end

