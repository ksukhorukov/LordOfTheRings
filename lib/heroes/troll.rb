require_relative './hero'

class Troll < Hero
  attr_reader :health, :strike, :skills

  def initialize
    super
    @strike = initial_strike
    @skills = initial_skills
  end

  def race
    :troll
  end

  def initial_health
    15
  end

  def initial_strike
    5
  end

  def initial_skills
    []
  end

  def diet
    [:orc, :hobbit]
  end
end