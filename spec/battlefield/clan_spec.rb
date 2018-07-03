require_relative '../spec_helper'

RSpec.describe Clan do 
  let(:clan) { Clan.new }

  it 'has non-empty generated name' do 
    expect(clan.name.size).to be_positive
  end

  it 'has no heroes initially' do
    expect(clan.heroes.size).to be_equal(0)
  end

  it 'has an empty set of artifacts initially' do 
    expect(clan.artefacts.size).to be_equal(0)
  end

  it 'is is neutral initially' do 
    expect(clan.mode).to be_equal(:neutral)
  end

  context 'with members' do 
    it 'is possible to add heroes to the clan' do 
      clan_with_heroes = Clan.new(
          members: 
            {
              hobbit: 2,
              hero: 1
            }
        )
      expect(clan_with_heroes.heroes.size).to be_equal(3)
    end

    it 'is alive' do 
      expect(Clan.new(members: { hero: 1})).to be_alive
    end

    it 'is possible to set mode for clan members' do 
      clan_in_attack = Clan.new(members: { orc: 5 }, mode: :attack)
      expect(clan_in_attack.heroes.count { |hero| hero.mode == :attack}).to be_equal(5)
    end

    it 'is not possible to init clan with members of undefined race' do 
      expect { Clan.new(members: {undefined_race: 1}) }.to raise_error
    end
  end

end