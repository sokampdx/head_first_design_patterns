module Quack
  def quack
    'Quack!'
  end
end

module MuteQuack
  def quack
    "<< Silence >>"
  end
end

module Squeak
  def quack
    "Squeak"
  end
end

module FlyWithWings
  def fly
    "I'm flying!"
  end
end

module FlyNoWay
  def fly
    "I can't fly"
  end
end

module FlyRocketPowered
  def fly
    "I'm flying with a rocket!"
  end
end

class Duck
  def swim
    "All ducks float, even decoys!"
  end
end

class MallardDuck < Duck
  include Quack
  include FlyWithWings

  def display
    "I'm a real Mallard duck"
  end
end

class ModelDuck < Duck
  include MuteQuack
  include FlyNoWay

  def display
    "I'm a model duck"
  end
end

def print(duck)
  puts duck.display, duck.quack, duck.fly, duck.swim, "-"*20
end

def main
  print(MallardDuck.new)

  duck = ModelDuck.new
  print(duck)

  duck.extend(FlyRocketPowered)
  print(duck)
end

main if __FILE__ == $0
