# frozen_string_literal: true

# Create human player
class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name)
    @weapon_level = 1
    super(name)
    @life_points = 100
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}."
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    new_weapon_level = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{new_weapon_level}."
    if new_weapon_level > @weapon_level
      @weapon_level = new_weapon_level
      puts 'Trop cool, ta nouvelle arme est meilleure que celle que tu as actuellement. Tu la prends.'
    else
      puts 'Dommage, la nouvelle arme est moins performante que celle actuelle, tu la laisses par terre ...'
    end
  end

  def search_health_pack
    dice_launch = rand(1..6)
    case dice_launch
    when 1
      puts "Tu n'as rien trouvé ..."
    when 2..5
      @life_points += 50
      puts 'Bravo, tu as trouvé un pack de +50 pv !!!'
      @life_points > 100 ? @life_points = 100 : @life_points
    when 6
      @life_points += 80
      @life_points > 100 ? @life_points = 100 : @life_points
      puts 'Waow, tu as trouvé un pack de +80 pv !!!'
    end
  end
end
