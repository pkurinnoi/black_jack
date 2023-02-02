class Controller

  MAIN_MENU = ['1. New game',
               '2. New deck',
               '0. Exit'].freeze

  def main_menu
    puts 'What you want to do?'
    puts(*MAIN_MENU)
  end

  def main_menu_run(item)
    case item
    when 1
      puts "Enter number of players"
    when 2
      @deck = Deck.new
      puts "Deck successfully created"
    end
  end
end
