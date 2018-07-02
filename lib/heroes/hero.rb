require_relative '../creatures/creature'

class Hero < Creature
  attr_reader :health 
  attr_accessor :weapon

  def initialize(args = {})
    super
    @strike = initial_strike
  end

  def race
    :hero
  end

  def strike
    initial_strike
  end

  def initial_strike
    GameSettings.settings[:hero_initial_strike]
  end

  def initial_health
    GameSettings.settings[:hero_initial_health]
  end

  def diet
    [:vegetable]
  end

  def sustenance
    GameSettings.settings[:hero_sustenance]
  end
end