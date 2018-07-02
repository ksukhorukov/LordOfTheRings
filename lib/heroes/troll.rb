require_relative './hero'

class Troll < Hero
  def initialize
    super
  end

  def race
    :troll
  end

  def initial_health
    25
  end

  def initial_strike
    10
  end

  def initial_skills
    []
  end

  def diet
    [:orc, :hobbit]
  end
end