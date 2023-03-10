require_relative 'controller'
require_relative 'game'
require_relative 'player'
require_relative 'playcard'
require_relative 'deck'


puts "Welcome to Black Jack game!"

controller = Controller.new

loop do
  controller.main_menu
  main_menu_item = gets.to_i
  break if main_menu_item.zero?

  controller.main_menu_run(main_menu_item)
end
