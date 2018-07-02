module Armed
  attr_accessor :weapon 

  def strike
    return weapon.strike + initial_strike if weapon
    initial_strike
  end
end