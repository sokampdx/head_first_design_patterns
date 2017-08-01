class Beverage
  attr_reader :description, :cost
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
    @description = 'Dark Roast Coffee'
    @cost = 0.99
  end
end

class Decaf < Beverage
  def initialize
    @description = 'Decaf'
    @cost = 1.05
  end
end

module Mocha
  def description
    super + ", Mocha"
  end

  def cost
    super + 0.20
  end
end

module SteamedMilk
  def description
    super + ", Steamed Milk"
  end

  def cost
    super + 0.10
  end
end

module Soy
  def description
    super + ", Soy"
  end

  def cost
    super + 0.15
  end
end

module Whip
  def description
    super + ", Whip"
  end

  def cost
    super + 0.10
  end
end

def main
  beverage = Espresso.new
  puts "#{beverage.description} #{beverage.cost}"

  beverage = DarkRoast.new
  beverage.extend(Mocha)
  beverage.extend(Mocha) # This extend does nothing
  beverage.extend(Whip)
  puts "#{beverage.description} #{beverage.cost}"

  beverage = HouseBlend.new
  beverage.extend(Soy)
  beverage.extend(Mocha)
  beverage.extend(Whip)
  puts "#{beverage.description} #{beverage.cost}"
end

main if __FILE__ == $0
