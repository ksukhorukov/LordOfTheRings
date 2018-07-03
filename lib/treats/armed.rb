module Armed
  attr_accessor :weapon 

  def strike
    return weapon_class.strike + initial_strike if weapon
    initial_strike
  end

  def weapon_class
    #:magic_sword => :magic_sword
    self.class.const_get(weapon.to_s.split('_').map { |e| e.capitalize }.join)
  end
end