require_relative '../spec_helper'
require_relative '../../lib/heroes/hero'

RSpec.describe Hero do 
  let(:hero) { Hero.new }



  it 'can has strike power equals 1' do 
    expect(hero.strike).to be_equal(1)
  end

  it 'has empty set of skills' do 
    expect(hero.skills.size).to eq(0)
  end


  it 'has hero race by default' do 
    expect(hero.race).to eq(:hero)
  end

  it 'is vegetarian by default' do 
    expect(hero.diet).to eq([:vegetarian])
  end
end