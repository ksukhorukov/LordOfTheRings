# frozen_string_literal: true

module Armed
  attr_accessor :weapon

  def strike
    return weapon_class.strike + initial_strike if weapon
    initial_strike
  end

  def weapon_class
    #:magic_sword => MagicSword
    self.class.const_get(weapon.to_s.split('_').map(&:capitalize).join)
  end
end
