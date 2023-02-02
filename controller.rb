class Controller

  MAIN_MENU = ['----------------------------',
               '1. New game',
               '2. Deck menu',
               '3. Fast start for 5 players',
               '0. Exit',
               '----------------------------'].freeze

  NEW_GAME_MENU = ['----------------------------',
                   '1. Create table',
                   '2. New shuffled deck',
                   '3. Add player',
                   '4. Join the table',
                   '----------------------------'].freeze

  DECK_MENU = ['----------------------------',
               '1. New deck',
               '2. Shuffle deck',
               '3. View deck',
               '----------------------------'].freeze

  def main_menu
    puts '> What you want to do?'
    puts(*MAIN_MENU)
  end

  def main_menu_run(item)
    case item
    when 1
      puts '> What you want to do?'
      puts(*NEW_GAME_MENU)
      new_game_menu(gets.to_i)
    when 2
      puts '> What you want to do?'
      puts(*DECK_MENU)
      deck_menu(gets.to_i)
    end
  end

  def new_game_menu(item)
    case item
    when 1
      @table = Table.new
    when 2
      @deck = Deck.new
      @deck.shuffle
    when 3
      @deck.view
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

    end
  end
end
