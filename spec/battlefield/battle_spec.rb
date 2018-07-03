require_relative '../spec_helper'
require_relative '../../lib/battlefield/clan'
require_relative '../../lib/battlefield/battle'

RSpec.describe Battle do 
  let(:first_clan) { Clan.new(
      members: {
        orc: 5
      },
      mode: :attack
    )}

  let(:second_clan) { Clan.new(
      members: {
        hobbit: 10,
      },
      mode: :defense
    )}

  let(:hobbits_with_magic_sword) { Clan.new(
      members: {
        hobbit: 10,
      },
      mode: :defense,
      weapon: MagicSword
    )}  

  let(:battle) { Battle.new(clans: [first_clan, second_clan]) }
  let(:hobbits_winns) { Battle.new(clans: [first_clan, hobbits_with_magic_sword]) }


  it 'raises exception if number of clans not equal two' do 
    expect { Battle.new }.to raise_error
  end

  it 'has undefined winner initially' do 
    expect(battle.winner).to be_nil
  end

  it 'correctly retrieves random clan members' do 
    first_clan_member = battle.send(:first_clan_member)
    second_clan_member = battle.send(:second_clan_member)
    expect(first_clan_member.class.to_s.downcase.to_sym).to be_equal(:orc)
    expect(second_clan_member.class.to_s.downcase.to_sym).to be_equal(:hobbit)
  end

  it 'correctly burries dead heroes' do 
    hero = battle.send(:first_clan_member)
    hero.damage(GameSettings.settings[:orc_initial_health] * 100)
    battle.send(:bury, [hero])
    expect(battle.dead_heroes.size).to be_equal(1)
  end

  it 'is possible to heal hero' do 
    victim = battle.send(:first_clan_member)
    victim.damage(GameSettings.settings[:orc_initial_health] * 2)
    battle.send(:bury, [victim])
    hero_to_heal = battle.send(:first_clan_member)
    hero_health_before_heal = hero_to_heal.health
    battle.send(:heal, [hero_to_heal])
    hero_health_after_heal = hero_to_heal.health
    expect(hero_health_after_heal).to be > hero_health_before_heal
  end

  it 'rejects dead heroes' do 
    first_clan_size = battle.send(:first_clan).heroes.size
    victim = battle.send(:first_clan_member)
    victim.damage(GameSettings.settings[:orc_initial_health] * 2)
    battle.send(:bury, [victim])
    expect { battle.send(:reject_dead_heroes) }.to change { battle.send(:first_clan).heroes.size }.by(-1)
  end

  context 'fight' do 
    it 'first clan winns and gets the price' do 
      battle.fight
      expect(battle.winner).to be_equal(first_clan)
    end

    it 'hobbits with magic sword winns' do 
      hobbits_winns.fight
      expect(hobbits_winns.winner).to be_equal(hobbits_with_magic_sword)
    end
  end
end