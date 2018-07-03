require_relative 'spec/spec_helper'

RSpec.describe Battle do 
  context 'fight' do
    it 'troll eats hobbit' do 
      troll_clan = Clan.new(
          members: {
            troll: 1
          },
          mode: :attack
        )
      hobbit_clan = Clan.new(
        members: {
          hobbit: 1
        },
        mode: :defense
      )
      initial_health_of_troll = troll_clan.heroes.first.health
      battle = Battle.new(clans: [troll_clan, hobbit_clan])
      battle.fight
      expect(battle.winner).to be_equal(troll_clan)
      expect(hobbit_clan.heroes.size).to be_equal(0)
    end

    it 'two orcs are fighting for hobbit' do 
      first_troll = Clan.new(
          members: {
            orc: 1
          },
          mode: :attack
        )
      second_troll = Clan.new(
        members: {
          orc: 1
        },
        mode: :defense
      )
      hobbit = Hobbit.new
      battle = Battle.new(clans: [first_troll, second_troll], prize: hobbit)
      battle.fight
      expect(battle.winner.artefacts).to match([hobbit])
    end

    it 'one troll attacking a group of orcs and dies' do 
      troll = Clan.new(
          members: {
            troll: 1
          },
          mode: :attack
        )
      orcs = Clan.new(
        members: {
          orc: 5
        },
        mode: :defense
      )
      battle = Battle.new(clans: [troll, orcs])
      battle.fight
      expect(battle.winner).to be_equal(orcs)
    end

    it 'a group of trolls attacks a group of orcs, winns and eats them' do 
      trolls = Clan.new(
          members: {
            troll: 5
          },
          mode: :attack
        )
      orcs = Clan.new(
        members: {
          orc: 5
        },
        mode: :defense
      )

      battle = Battle.new(clans: [trolls, orcs])
      battle.fight
      expect(battle.winner).to be_equal(trolls)
      expect(orcs.alive?).to be_equal(false)
      expect(orcs.heroes.size).to be_equal(0)
    end

    it 'two trolls try to eat the orc with magic sword and dies' do
      trolls = Clan.new(
          members: {
            troll: 2
          },
          mode: :attack
        )
      orc = Clan.new(
        members: {
          orc: 1
        },
        mode: :defense,
        weapon: :magic_sword
      )

      battle = Battle.new(clans: [trolls, orc])
      battle.fight
      expect(battle.winner).to be_equal(orc)
    end

      it 'a group of orcs and hobbits fightng with two trolls and wins' do
      hobbits_and_orcs = Clan.new(
          members: {
            orc: 4,
            hobbit: 5
          },
          mode: :attack
        )
      trolls = Clan.new(
        members: {
          troll: 2
        },
        mode: :attack,
      )

      battle = Battle.new(clans: [hobbits_and_orcs, trolls])
      expect(battle.first_clan.heroes.size).to be_equal(9)
      battle.fight
      expect(battle.winner).to be_equal(hobbits_and_orcs)
    end
  end
end