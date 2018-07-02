class Hero
  attr_reader :health, :strike, :skills

  def initialize
    @health = initial_health
    @strike = initial_strike
    @skills = initial_skills
  end

  def damage(hit)
    @health -= hit
  end

  def alive?
    health > 0
  end

  def race
    :hero
  end

  def initial_health
    5
  end

  def initial_strike
    1
  end

  def initial_skills
    []
  end

  def diet
    [:vegetarian]
  end

  def eat(product)
    @healt += hero.initial_health if can_eat?(hero)
  end

  def can_eat?(hero)
    diet.include? hero.race
  end
end