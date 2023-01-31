# frozen_string_literal: true

# Create player
class Player
  attr_accessor :name, :life_points

  def initialize(name)
    @life_points = 10
    @name = name
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie"
  end

  def gets_damage(damage)
    @life_points -= damage
    if @life_points <= 0
      @life_points = 0
      puts "Le joueur #{@name} a été tué !"
    end
  end

  def attacks(player)
    puts "#{@name} attaque le joueur #{player.name}."
    life_lost = compute_damage
    puts "Il lui inflige #{life_lost} points de dommages."
    player.gets_damage(life_lost)
  end

  def compute_damage
    rand(1..6)
  end
end
