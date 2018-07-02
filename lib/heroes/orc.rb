require_relative './hero'

class Orc < Hero
  def initialize
    super
  end

  def race
    :orc
  end

  def initial_health
    GameSettings.settings[:orc_initial_health]
  end

  def strike
    @weapon&.strike || initial_strike
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
end