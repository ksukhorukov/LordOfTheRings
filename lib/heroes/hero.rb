require_relative '../creatures/creature'

class Hero < Creature
  attr_reader :health, :mode
  attr_accessor :weapon

  def initialize(args = {})
    super
    @strike = initial_strike
    @mode = args.fetch(:mode, :defense)
  end

  def race
    :hero
  end

  def strike
    initial_strike
  end

  def diet
    [:vegetable]
  end

  def sustenance
    GameSettings.settings[:hero_sustenance]
  end

  def damage(hit)
    if mode == :defense
      potential_damage = defense - hit
      @health -= potential_damage * -1 if potential_damage < 0
    else
      @health -= hit
    end
  end

  def defense
    GameSettings.settings[:hero_defense]
  end

  private

  def initial_strike
    GameSettings.settings[:hero_initial_strike]
  end

  def initial_health
    GameSettings.settings[:hero_initial_health]
  end
end