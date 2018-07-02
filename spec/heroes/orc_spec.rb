require_relative '../spec_helper'
require_relative '../../lib/heroes/orc'
require_relative '../../lib/settings/game_settings'

RSpec.describe Orc do 
  let(:orc) { Orc.new }

  it 'has health eqauls 15' do 
    expect(orc.health).to be_equal(GameSettings.settings[:orc_initial_health])
  end

  it 'has strike eqauls 5' do 
    expect(orc.strike).to be_equal(GameSettings.settings[:orc_initial_strike])
  end

  it 'can eat orcs and hobbits' do 
    expect(orc.diet.size).to be_equal(2)
    expect(orc.diet).to match([:orc, :hobbit])
  end

  it 'has race orc' do 
    expect(orc.race).to be_equal(:orc)
  end
end