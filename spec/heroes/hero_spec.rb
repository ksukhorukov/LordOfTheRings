require_relative '../spec_helper'
require_relative '../../lib/heroes/hero'
require_relative '../../lib/settings/game_settings'

RSpec.describe Hero do 
  let(:hero) { Hero.new }

  it 'has health equals 5' do 
    expect(hero.health).to be_equal(GameSettings.settings[:hero_initial_health])
  end

  it 'can has strike power equals 1' do 
    expect(hero.strike).to be_equal(GameSettings.settings[:hero_initial_strike])
  end

  it 'has race hero' do 
    expect(hero.race).to eq(:hero)
  end

  it 'is vegetarian by default' do 
    expect(hero.diet).to eq([:vegetable])
  end
end