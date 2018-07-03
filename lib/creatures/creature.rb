require_relative '../settings/game_settings'

class Creature
  attr_reader :health

  def initialize(args = {})
    @health = initial_health
  end

  def damage(hit)
    @health -= hit
  end

  def initial_health
    GameSettings.settings[:creature_initial_health]
  end

  def alive?
    health.positive?
  end

  def eat(product)
    @health += product.sustenance if can_eat?(product) && !product.alive?
  end

  def diet
    [:sun, :water]
  end

  def can_eat?(product)
    diet.include? product.class.to_s.downcase.to_sym
  end

  def sustenance
    GameSettings.settings[:creature_sustenance]
  end

  def race
    :vegetable
  end
end