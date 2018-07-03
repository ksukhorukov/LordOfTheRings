require_relative '../spec_helper'
require_relative '../../lib/heroes/hobbit'
require_relative '../../lib/weapons/magic_sword'
require_relative '../../lib/settings/game_settings'

RSpec.describe Hobbit do 
  let(:hobbit) { Hobbit.new }

  it 'has health eqauls 10' do 
    expect(hobbit.health).to be_equal(GameSettings.settings[:hobbit_initial_health])
  end

  it 'has strike eqauls 2' do 
    expect(hobbit.strike).to be_equal(GameSettings.settings[:hobbit_initial_strike])
  end

  it 'has race hobbit' do 
    expect(hobbit.race).to be_equal(:hobbit)
  end

  context 'hobbit with magic sword' do 
    let(:hobbit_with_magic_sword) { Hobbit.new(weapon: :magic_sword)}

    it 'strike power equals 97' do 
      expect(hobbit_with_magic_sword.strike).to be_equal(
        GameSettings.settings[:hobbit_initial_strike] + GameSettings.settings[:magic_sword_strike]
      )
    end
  end
end