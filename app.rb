# frozen_string_literal: true

require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/human_player'

player1 = Player.new('Alec')
player2 = Player.new('John')
turn = 1

while player1.life_points.positive? && player2.life_points.positive?
  puts '-' * 40
  puts "#{' ' * 15} Tour n°#{turn}", ''
  puts "Voici l'état de chaque joueur :"
  player1.show_state
  puts player2.show_state
  puts "Passons à la phase d'attaque :"
  player1.attacks(player2)
  break if player2.life_points <= 0
  puts player2.attacks(player1)
  turn += 1
end
