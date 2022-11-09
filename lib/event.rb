class Event
  attr_reader :name,
              :food_trucks
  def initialize(name)
    @name = name
    @food_trucks = []
  end
  
  def add_food_truck(truck)
    @food_trucks << truck
  end
  
  def food_truck_names
    @food_trucks.map { |truck| truck.name}
  end
  
  def food_trucks_that_sell(item)
    @food_trucks.find_all { |truck|      truck.inventory.keys.include?(item)}
  end
  
  def total_stock
    require 'pry' ; binding.pry
    all_stock = @food_trucks.map { |truck| truck.inventory}
    #iterate through hash to get names as an array, uniq and sort
  end
  
  # def overstocked_items
  # 
  # end
end


