#The base component that we are
# choosing to decorate with new
# behavior is the Coffee class.
class Coffee
  attr_accessor :price

  # The Coffee class has a
  # price method.
  def price
    2.50
  end
end

# Our first decorator in this
# exaxmple of the Decorator pattern
# is a CoffeeWithCream class.
class CoffeeWithCream
  
  # The decorator accepts a coffee
  # object. The coffee object is the
  # component that is to be 'enclosed'
  # by this decorator.
  def initialize(coffee)
    @coffee = coffee
  end

  # We are adding additional behavior
  # to the 'price' method of the coffee
  # component by adding to it the price
  # of coffee cream.
  def price
    @coffee.price += 0.50
  end
end

class CoffeeWithSugar
  
  # The decorator accepts a coffee
  # object. The coffee object is the
  # component that is to be 'enclosed'
  # by this decorator.
  def initialize(coffee)
    @coffee = coffee
  end

  # We are adding additional behavior
  # to the 'price' method of the coffee
  # component by adding to it the price
  # of sugar.
  def price
    @coffee.price += 0.25
  end
  
  # We are adding an additional operation
  # which we are then able to call on the
  # enclosed, decorated coffee object.
  def induce_sugar_rush
    # code to induce sugar rush goes here.
  end
end

# Here, we create a new Coffee object,
# enclose it with a CoffeeWithCream decorator,
# then enclose it with a CoffeeWithSugar
# decorator.
coffee = Coffee.new
coffee = CoffeeWithCream.new(coffee)
coffee = CoffeeWithSugar.new(coffee)

# We can call price and get the combined price of
# the coffee, coffee sugar, and coffee cream.
# The final total: $3.25.
puts coffee.price # 3.25

# We can call the added operation 'induce_sugar_rush'.
# The method executes and returns the message
# "sugar rush induced.".
puts coffee.induce_sugar_rush # "sugar rush induced."