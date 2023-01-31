# frozen_string_literal: true

require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/human_player'

turn = 1

puts '-' * 51
puts "| Bienvenue sur 'ILS VEULENT TOUS MA POO' !!!     |"
puts "| Le but du jeu est d'être le dernier survivant ! |"
puts '-' * 51
puts 'Quel est ton prénom jeune guerrier ?'
human_name = gets.chomp
user = HumanPlayer.new(human_name)
enemies = []
enemies << player1 = Player.new('John')
enemies << player2 = Player.new('Olek')
while user.life_points.positive? && (player1.life_points.positive? || player2.life_points.positive?)
  puts '-' * 30
  puts "#{' ' * 15} Tour n°#{turn}", ''
  user.show_state
  puts ''
  puts 'Quelle action veux-tu effectuer ?'
  puts 'a : chercher une meilleure arme'
  puts 's : chercher à se soigner', ''
  puts 'attaquer un joueur :'
  puts "0 : #{player1.name} a #{player1.life_points} points de vie."
  puts "1 : #{player2.name} a #{player2.life_points} points de vie.", ''
  choice = gets.chomp
  case choice
  when 'a'
    user.search_weapon
  when 's'
    user.search_health_pack
  when '0'
    user.attacks(player1)
  when '1'
    user.attacks(player2)
  end
  turn += 1
  puts 'Les autres joueurs ripostent'
  enemies.each do |enemy|
    enemy.attacks(user) if enemy.life_points.positive?
  end

end
puts 'La partie est terminée.'
if user.life_points.positive? && (player1.life_points <= 0 && player2.life_points <= 0)
  puts 'BRAVO, TU AS GAGNÉ'
else
  puts 'Gros NOOB, tu as perdu !!!'
end
