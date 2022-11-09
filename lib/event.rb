require './lib/item'
require './lib/food_truck'

class Event
  attr_reader :name,
              :food_trucks

 def initialize(name)
  @name = name
  @food_trucks = []
 end

 def add_food_truck

 end
end
