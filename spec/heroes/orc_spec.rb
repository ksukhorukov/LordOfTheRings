require_relative '../spec_helper'

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

  context 'orc with magic sword' do 
    let(:orc_with_magic_sword) { Orc.new(weapon: :magic_sword)}

    it 'strike power equals 100' do 
      expect(orc_with_magic_sword.strike).to be_equal(
        GameSettings.settings[:orc_initial_strike] + GameSettings.settings[:magic_sword_strike]
      )
    end
  end
end