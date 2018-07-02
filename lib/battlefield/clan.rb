require_relative '../settings/game_settings'
require_relative '../heroes/hobbit'
require_relative '../heroes/troll'
require_relative '../heroes/hero'
require_relative '../heroes/orc'

class Clan
  attr_accessor :heroes
  attr_reader :mode

  def initialize(members: {}, mode: :neutral)
    @heroes = []
    @mode = mode
    heroes_factory(members) unless members.empty?
  end

  private

  def heroes_factory(members)
    members.each { |race, size| init_heroes_of_race(race, size) }
  end

  def init_heroes_of_race(race, size)
    raise "Undefined race #{race}" unless GameSettings.settings[:races].include? race
    size.times { @heroes << self.class.const_get(race.to_s.capitalize).new(mode: mode) }
  end
end