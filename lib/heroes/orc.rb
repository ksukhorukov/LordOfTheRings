# frozen_string_literal: true

require_relative './hero'
require_relative '../weapons/magic_sword'
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

  def diet
    %i[orc hobbit]
  end

  def sustenance
    GameSettings.settings[:orc_sustenance]
  end

  def defense
    GameSettings.settings[:orc_defense]
  end

  private

  def initial_health
    GameSettings.settings[:orc_initial_health]
  end

  def initial_strike
    GameSettings.settings[:orc_initial_strike]
  end
end
