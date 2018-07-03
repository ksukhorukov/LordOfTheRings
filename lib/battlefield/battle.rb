class Batle
  attr_reader :clans, :prize, :winner, :dead_heroes

  def intialize(clans: clans, prize: nil)
    raise 'You need to define two clans' if clans.size != 2
    @clans = clans
    @prize = prize
    @dead_heroes = []
    @winner = 'fight will show'
  end

  def fight
    while(true) {
      break unless first_clan.alive? || second_clan.alive?
      first_hero = first_clan_member
      second_hero = second_clan_member

      heal([first_hero, second_hero])

      first_hero.damage(second_hero.strike)
      second_hero.damage(first_hero.strike)

      bury([first_hero, second_hero])
    }
    define_winner
    @winner.artefacts << prize unless prize.nil?
  end

  private

  def firtst_clan
    clans[0]
  end

  def second_clan
    clans[1]
  end

  def define_winner
    @winner = first_clan.alive? ? first_clan : second_clan
  end

  def heal(heroes = [])
    heroes.each { |hero|
      dead_heroes.each_with_index { |dead_hero, position|
        if hero.can_eat? dead_hero
          hero.eat(dead_hero)
          @dead_heroes.delete_at(position)
        end
      }
    }
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
    clans.each { |clan|
      clan.heroes.reject! { |hero| !hero.alive? }
    }
  end
end