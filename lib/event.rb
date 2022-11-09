class Event
  attr_reader :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end 

  def add_food_truck(truck)
    @food_trucks << truck
  end 

  def food_truck_names
    @food_trucks.map {|truck| truck.name}
  end 

  def food_trucks_that_sell(item)
    food_trucks.find_all {|truck| truck.inventory.include?(item)}
  end 

  def overstocked
    food_trucks_inventory = @food_trucks.map {|food_truck| food_truck.inventory}
    items_in_more_than_1_truck = []
    food_trucks_inventory.each do |inventory|
      inventory.each do |item, count|
        if food_trucks_that_sell(item).count > 1 
          items_in_more_than_1_truck << item
        end 
      end 
    end
  end

  def food_truck_items_alphabetically 
  end 
  
end
