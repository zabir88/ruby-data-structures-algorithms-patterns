# Observer Pattern
require 'observer'

class Car
  include Observable
  
  attr_accessor :mileage
  
  def initialize(mileage)
    @mileage = mileage
    add_observer(Service.new)
  end
  
  def log
    changed
    notify_observers(self)
  end
end

class Service
  def update(car)
    if car.mileage > 10000 
      puts "Total mileage is #{car.mileage}. You need to go for servicing."
    else
      puts "Total mileage is #{car.mileage}. #{10000-car.mileage} miles left before car needs servicing."
    end 
  end
end

car = Car.new(1000)
car.log
