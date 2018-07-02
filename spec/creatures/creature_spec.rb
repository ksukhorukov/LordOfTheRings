require_relative '../spec_helper'
require_relative '../../lib/creatures/creature'

RSpec.describe Creature do 
  let (:creature) { Creature.new }

  it 'has health eqauls 2' do 
    expect(creature.health).to be_equal(2)
  end

  it 'is alive after creation' do 
    expect(creature.alive?).to be_equal(true)
  end

  it 'can be damaged' do 
    creature.damage(1)
    expect(creature.health).to be_equal(1)
  end

  it 'can be killed' do 
    creature.damage(2)
    expect(creature.alive?).to be(false)
  end

  it 'eat sun' do 
    expect(creature.diet.size).to be_equal(1)
    expect(creature.diet[0]).to be_equal(:sun)
  end
end