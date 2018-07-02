require_relative './hero'
require_relative '../treats/armed'

class Orc < Hero
  include Armed
  
  def initialize(args = {})
    super(args)
    @weapon = args.fetch(:weapon, nil)
  end

  def race
    :orc
  end

  def initial_health
    GameSettings.settings[:orc_initial_health]
  end
  
  def initial_strike
    GameSettings.settings[:orc_initial_strike]
  end

  def diet
    [:orc, :hobbit]
  end

  def sustenance
    GameSettings.settings[:orc_sustenance]
  end

  def defense
    GameSettings.settings[:orc_defense]
  end
end