require_relative '../spec_helper'

RSpec.describe Hero do 
  let(:hero) { Hero.new }

  it 'has health equals 5' do 
    expect(hero.health).to be_equal(GameSettings.settings[:hero_initial_health])
  end

  it 'has an empty bag initially' do 
    expect(hero.bag.size).to be_equal(0)
  end

  it 'can has strike power equals 1' do 
    expect(hero.strike).to be_equal(GameSettings.settings[:hero_initial_strike])
  end

  it 'has race hero' do 
    expect(hero.race).to be_equal(:hero)
  end

  it 'is vegetarian by default' do 
    expect(hero.diet).to match([:vegetable])
  end

  context 'hero in attack' do 
    it 'health will be decreased exactly by the power of hit' do 
      hero_in_attack = Hero.new(mode: :attack)
      hero_in_attack.damage(1)
      expect(hero_in_attack.health).to be_equal((GameSettings.settings[:hero_initial_health]) - 1)
    end
  end

  context 'hero in defense' do 
    let(:hero_in_defense) { Hero.new(mode: :defense) }

    it 'will be alive even in case of strike equals to his initial health' do 
      hero_in_defense.damage(GameSettings.settings[:hero_initial_health])
      expect(hero.alive?).to be(true)
    end
  end
end