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
  end


end