#!/usr/bin/env ruby

require_relative 'lib/battlefield/clan'
require_relative 'lib/battlefield/battle'

clan_of_orcs = Clan.new(
    name: 'Bad guys',
    members: {
      orc: 1000
    },
    mode: :attack
  )

clan_of_hobbits = Clan.new(
    name: 'Good guys',
    members: {
      hobbit: 1000
    },
    mode: :defense,
    weapon: :magic_sword
  )

battle = Battle.new(clans: [clan_of_orcs, clan_of_hobbits])

puts "[+] Fight!"

battle.fight

puts "[+] The winner is: #{battle.winner.name}"

