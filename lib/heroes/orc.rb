require_relative './hero'

class Orc < Hero
  def initialize
    super
  end

  def race
    :orc
  end

  def initial_health
    15
  end

  def strike
    @weapon&.strike || initial_strike
  end
  
  def initial_strike
    5
  end

  def diet
    [:orc, :hobbit]
  end
end