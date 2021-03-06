require_relative '../spec_helper'

RSpec.describe Troll do 
  let(:troll) { Troll.new }

  it 'has health eqauls 25' do 
    expect(troll.health).to be_equal(GameSettings.settings[:troll_initial_health])
  end

  it 'has strike eqauls 10' do 
    expect(troll.strike).to be_equal(GameSettings.settings[:troll_initial_strike])
  end

  it 'can eat sun and water' do 
    expect(troll.diet.size).to be_equal(2)
    expect(troll.diet).to match([:orc, :hobbit])
  end

  it 'has race vegetable' do 
    expect(troll.race).to be_equal(:troll)
  end
end