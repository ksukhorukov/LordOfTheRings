require_relative '../creatures/creature'

class Hero < Creature
  attr_reader :health, :strike, :skills

  def initialize
    super
    @strike = initial_strike
    @skills = initial_skills
  end

  def race
    :hero
  end

  def initial_health
    5
  end

  def initial_strike
    1
  end

  def initial_skills
    []
  end

  def diet
    [:vegetable]
  end
end