class Controller

  MAIN_MENU = ['----------------------------',
               '1. New game',
               '0. Exit',
               '----------------------------'].freeze

  def main_menu
    puts(*MAIN_MENU)
  end

  def main_menu_run(item)
    case item
    when 1
      Game.new
    end
  end
end

