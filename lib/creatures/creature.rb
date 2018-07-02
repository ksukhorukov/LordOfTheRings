class Creature
  attr_reader :health

  def initialize
    @health = initial_health
  end

  def damage(hit)
    @health -= hit
  end

  def initial_health
    2
  end

  def alive?
    health.positive?
  end

  def eat(product)
    @health += product.sustenance if can_eat?(product) && !product.alive?
  end

  def diet
    [:sun, :water]
  end

  def can_eat?(product)
    diet.include? product
  end

  def sustenance
    1
  end

  def race
    :vegetable
  end
end