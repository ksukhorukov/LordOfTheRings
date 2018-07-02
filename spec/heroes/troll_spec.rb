require_relative '../spec_helper'
require_relative '../../lib/heroes/troll'

RSpec.describe Troll do 
  let(:troll) { Troll.new }

  it 'has health eqauls 15' do 
    expect(troll.health).to be_equal(15)
  end

  it 'has strike eqauls 5' do 
    expect(troll.strike).to be_equal(5)
  end

  it 'can eat sun and water' do 
    expect(troll.diet.size).to be_equal(2)
    expect(troll.diet).to match([:orc, :hobbit])
  end

  it 'has race vegetable' do 
    expect(troll.race).to be_equal(:troll)
  end
end