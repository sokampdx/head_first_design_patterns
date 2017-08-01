class SimplePizzaFactory
  def create(type)
    case type
    when 'cheese'
      CheesePizza.new
    when 'pepperoni'
      PepperoniPizza.new
    when 'clam'
      ClamPizza.new
    when 'veggie'
      VeggiePizza.new
    end
  end
end

class PizzaStore
  def initialize(factory)
    @factory = factory
  end

  def order(type)
    pizza = @factory.create(type)
    pizza.prepare
    pizza.bake
    pizza.cut
    pizza.box
    pizza
  end
end

class Pizza
  attr_accessor :name

  def initialize
    @toppings = []
  end

  def name
    @name
  end

  def prepare
    puts "Preparing #{@name}"
    puts "Tossing #{@dough} ..."
    puts "Adding #{@sauce} ..."
    print "Adding topping:"
    @toppings.each { |topping| print " #{topping}" }
    puts
  end

  def bake
    puts "Bake for 25mins at 350°"
  end

  def cut
    puts "Cutting pizza into diagonal shapes"
  end

  def box
    puts "Place pizza in official Pizza Store box"
  end
end

class CheesePizza < Pizza
  def initialize
    super
    @name = 'Cheese Pizza'
    @dough = 'Thin cut dough'
    @sauce = 'Marinara sauce'
    @toppings << 'Grated Reggiano Cheese'
  end
end

class PepperoniPizza < Pizza
  def initialize
    super
    @name = 'Pepperoni Pizza'
    @dough = 'Thin cut dough'
    @sauce = 'Marinara sauce'
    @toppings << 'Sliced Pepperoni'
  end
end

class ClamPizza < Pizza
  def initialize
    super
    @name = 'Clam Pizza'
    @dough = 'Thin cut dough'
    @sauce = 'Clam sauce'
    @toppings << 'Clam'
  end
end

class VeggiePizza < Pizza
  def initialize
    super
    @name = 'Veggie Pizza'
    @dough = 'Thin cut dough'
    @sauce = 'Marinara sauce'
    @toppings << 'Pineapplie' << 'Mushroom' << 'Bell Pepper'
  end
end

def main
  factory = SimplePizzaFactory.new
  pizza_store = PizzaStore.new(factory)
  pizza = pizza_store.order('cheese')
  puts pizza.name
  pizza = pizza_store.order('pepperoni')
  puts pizza.name
  pizza = pizza_store.order('clam')
  puts pizza.name
  pizza = pizza_store.order('veggie')
  puts pizza.name
end

main if __FILE__ == $0
