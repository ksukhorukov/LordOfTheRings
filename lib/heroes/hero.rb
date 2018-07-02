require_relative '../creatures/creature'

class Hero < Creature
  attr_reader :health 
  attr_accessor :weapon

  def initialize(args = {})
    super
    @weapon = args.fetch(:weapon, nil)
    @strike = initial_strike
  end

  def race
    :hero
  end

  def strike
    @weapon&.strike || initial_strike
  end

  def initial_strike
    1
  end

  def initial_health
    5
  end


  def diet
    [:vegetable]
  end
end