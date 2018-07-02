class GameSettings
  def self.settings 
    {
      #Creatures
      creature_initial_health: 2,
      creature_sustenance: 1,

      #Heros
      hero_initial_health: 5,
      hero_initial_strike: 1,
      hero_sustenance: 5,
      hero_defense: 2,

      #Orcs
      orc_initial_health: 15,
      orc_initial_strike: 5,
      orc_sustenance: 10,
      orc_defense: 5,

      #Trolls
      troll_initial_health: 25,
      troll_initial_strike: 10,
      troll_sustenance: 15,
      troll_defense: 10,

      #Hobbits
      hobbit_initial_health: 10,
      hobbit_initial_strike: 2,
      hobbit_sustenance: 5,
      hobbit_defense: 2,

      races: [:hero, :hobbit, :orc, :troll],

      #Weapons
      magic_sword_strike: 95
    }
  end
end