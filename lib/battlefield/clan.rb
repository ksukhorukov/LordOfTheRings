require_relative '../settings/game_settings'
require_relative '../heroes/hobbit'
require_relative '../heroes/troll'
require_relative '../heroes/hero'
require_relative '../heroes/orc'

class Clan
  attr_reader :mode, :name, :weapon
  attr_accessor :heroes, :artefacts

  def initialize(name: nil, members: {}, mode: :neutral, artefacts: [], weapon: nil)
    @name = name || generate_name
    @heroes = []
    @mode = mode
    @artefacts = artefacts
    @weapon = weapon
    heroes_factory(members) unless members.empty?
  end

  def alive?
    heroes.count { |hero| hero.alive? } > 0
  end

  private

  def generate_name
    "Clan #{rand(100_000)}"
  end

  def heroes_factory(members)
    members.each { |race, size| init_heroes_of_race(race, size) }
  end

  def init_heroes_of_race(race, size)
    raise "Undefined race #{race}" unless GameSettings.settings[:races].include? race
    size.times { @heroes << self.class.const_get(race.to_s.capitalize).new(mode: mode, weapon: weapon) }
  end
end