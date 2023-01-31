# frozen_string_literal: true

require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/human_player'

my_game = Game.new('Alec')
my_game.menu_choice(my_game.menu)

binding.pry


# while user.life_points.positive? && (player1.life_points.positive? || player2.life_points.positive?)
#   choice = gets.chomp
#   case choice
#   when 'a'
#     user.search_weapon
#   when 's'
#     user.search_health_pack
#   when '0'
#     user.attacks(player1)
#   when '1'
#     user.attacks(player2)
#   end
#   turn +=1
#   puts 'Les autres joueurs ripostent'
#   enemies.each do |enemy|
#     enemy.attacks(user) if enemy.life_points.positive?
#   end

# end
# puts 'La partie est terminée.'
# if user.life_points.positive? && (player1.life_points <= 0 && player2.life_points <= 0)
#   puts 'BRAVO, TU AS GAGNÉ'
# else
#   puts 'Gros NOOB, tu as perdu !!!'
# end
