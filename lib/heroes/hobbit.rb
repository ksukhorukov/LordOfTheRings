# frozen_string_literal: true

require_relative './hero'
require_relative '../weapons/magic_sword'
require_relative '../treats/armed'

class Hobbit < Hero
  include Armed

  def initialize(args = {})
    super(args)
    @weapon = args.fetch(:weapon, nil)
  end

  def race
    :hobbit
  end

  def sustenance
    GameSettings.settings[:hobbit_sustenance]
  end

  def defense
    GameSettings.settings[:hobbit_defense]
  end

  private

  def initial_health
    GameSettings.settings[:hobbit_initial_health]
  end

  def initial_strike
    GameSettings.settings[:hobbit_initial_strike]
  end
end
