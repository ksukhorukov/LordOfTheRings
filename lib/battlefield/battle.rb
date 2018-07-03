# frozen_string_literal: true

class Battle
  attr_reader :clans, :prize, :winner, :dead_heroes

  def initialize(clans: [], prize: nil)
    raise 'You need to define two clans' if clans.size != 2
    @clans = clans
    @prize = prize
    @dead_heroes = []
    @winner = nil
  end

  def fight
    loop do
      break unless first_clan.alive? && second_clan.alive?

      first_hero = first_clan_member
      second_hero = second_clan_member

      heal([first_hero, second_hero])

      first_hero.damage(second_hero.strike)
      second_hero.damage(first_hero.strike)

      bury([first_hero, second_hero])

      reject_dead_heroes
    end

    define_winner
    @winner.artefacts << prize unless prize.nil?
  end

  def first_clan
    clans[0]
  end

  def second_clan
    clans[1]
  end

  private

  def define_winner
    @winner = first_clan.alive? ? first_clan : second_clan
  end

  def heal(heroes = [])
    heroes.each do |hero|
      food = dead_heroes.sample { |dead_hero| hero.can_eat? dead_hero }
      next if food.nil?
      hero.eat(food)
      @dead_heroes.delete_at(dead_heroes.index(food))
    end
  end

  def bury(heroes = [])
    heroes.each { |hero| @dead_heroes << hero unless hero.alive? }
  end

  def first_clan_member
    clans[0].heroes.sample
  end

  def second_clan_member
    clans[1].heroes.sample
  end

  def reject_dead_heroes
    clans.each { |clan| clan.heroes.select!(&:alive?) }
  end
end
