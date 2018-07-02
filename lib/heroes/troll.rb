require_relative './hero'

class Troll < Hero
  def initialize(args = {})
    super(args)
  end

  def race
    :troll
  end

  def initial_health
    GameSettings.settings[:troll_initial_health]
  end
  
  def initial_strike
    GameSettings.settings[:troll_initial_strike]
  end

  def diet
    [:orc, :hobbit]
  end

  def sustenance
    GameSettings.settings[:troll_sustenance]
  end

  def defense
    GameSettings.settings[:troll_defense]
  end
end