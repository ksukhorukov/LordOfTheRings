class GameSettings
  def self.settings 
    {
      #Creatures
      creature_initial_health: 2,
      creature_sustenance: 1,

      #Heros
      hero_ihealth: 5,
      hero_initial_strike: 1,
      hero_sustenance: 5,

      #Orcs
      orc_initial_health: 15,
      orc_initial_strike: 5,
      orc_sustenance: 10,

      #Trolls
      troll_initial_health: 25,
      troll_initial_strike: 10,
      troll_sustenance: 15,

      #Weapons
      magic_sword_strike: 95
    }
  end
end