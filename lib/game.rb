# frozen_string_literal: true

require 'bundler'
Bundler.require

# Create game class to control the app execution
class Game
  attr_accessor :human_player, :enemies

  def initialize(name)
    @human_player = HumanPlayer.new(name)
    number_of_enemies = 4
    @enemies = []
    number_of_enemies.times do |enemy|
      @enemies << Player.new("player#{enemy}")
    end
  end

  def kill_player(player)
    @enemies.reject(player.life_points <= 0)
  end

  def is_still_ongoing?
    @human_player.life_points.positive? && @enemies.length.positive? ? true : false
  end

  def show_players
    @human_player.show_state
    puts "Il reste #{@enemies.length} joueurs"
  end

  def menu
    puts 'Quelle action veux-tu effectuer ?'
    puts 'a : chercher une meilleure arme'
    puts 's : chercher à se soigner', ''
    puts 'attaquer un joueur :'
    @enemies.each do |enemy|
      puts "#{enemies.index(enemy)} : #{enemy.name} a #{enemy.life_points} points de vie" if enemy.life_points.positive?
    end
  choice = gets.chomp
  end

  def menu_choice(choice)
    case choice
    when 'a'
      @human_player.search_weapon
    when 's'
      @human_player.search_health_pack
    when '0'
      @human_player.attacks(player0)
    when '1'
      @human_player.attacks(player0)
    end
  end
end
