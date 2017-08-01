class Beverage
  attr_reader :description, :cost
end

class CondimentDecorator < Beverage
  def initialize(beverage)
    @beverage = beverage
  end
end

class Espresso < Beverage
  def initialize
    @description = 'Espresso'
    @cost = 1.99
  end
end

class HouseBlend < Beverage
  def initialize
    @description = 'House Blend Coffee'
    @cost = 0.89
  end
end

class DarkRoast < Beverage
  def initialize
    @description = 'Dark Roast Coffe'
    @cost = 0.99
  end
end

class Decaf < Beverage
  def initialize
    @description = 'Decaf'
    @cost = 1.05
  end
end

class Mocha < CondimentDecorator
  def description
    "#{@beverage.description}, Mocha"
  end

  def cost
    0.20 + @beverage.cost
  end
end

class SteamedMilk < CondimentDecorator
  def description
    "#{@beverage.description}, Steamed Milk"
  end

  def cost
    0.10 + @beverage.cost
  end
end

class Soy < CondimentDecorator
  def description
    "#{@beverage.description}, Soy"
  end

  def cost
    0.15 + @beverage.cost
  end
end

class Whip < CondimentDecorator
  def description
    "#{@beverage.description}, Whip"
  end

  def cost
    0.10 + @beverage.cost
  end
end

def main
  beverage = Espresso.new
  puts "#{beverage.description} #{beverage.cost}"

  beverage = DarkRoast.new
  beverage = Mocha.new(beverage)
  beverage = Mocha.new(beverage)
  beverage = Whip.new(beverage)
  puts "#{beverage.description} #{beverage.cost}"

  beverage = HouseBlend.new
  beverage = Soy.new(beverage)
  beverage = Mocha.new(beverage)
  beverage = Whip.new(beverage)
  puts "#{beverage.description} #{beverage.cost}"
end

main if __FILE__ == $0
