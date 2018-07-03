# Lord of The Rings

There are trolls, orcs and hobbits. Trolls can eat orcs and hobbits. Orcs can eat each other and hobbits. Everybody can fight. Orcs and hobbits can use weapons. If a clan tries to attack another clan, then this clan becomes an aggressor and another clan becomes a defender and they are starting to fight. 
An attempt to eat another clan is successful if all heroes of opposite clan are dead. 
Everything matters during the fight: race of heroes, number of heroes and weapons that they use.

## Simulated scenarioues

* A troll eats hobbit
* Two orcs fighting with each other for hobbit. The winner eats hobbit.
* A troll tried to eat a group of orcs but failed
* A group of orcs successfully attacked a group of hobbits
* Two trolls tried to eat an orc with magic sword but failed
* A group of hobbits in cooperation with a group of orcs fights with two trolls and winns

## Requirements

Ruby 2.5.0

## Install & Run

```
$ gem install bundler
$ bundle
$ rspec
$ rspec game_spec.rb --color --format doc
$ chmod +x game.rb && ./game.rb
```

## [EOF]