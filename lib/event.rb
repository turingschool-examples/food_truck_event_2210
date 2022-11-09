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
    @food_trucks.map do |truck|
      truck.name
    end
  end

  def food_trucks_that_sell(item)
    truck_include_item = []
    @food_trucks.find_all do |truck|
      if truck.inventory.include?(item)
        truck_include_item << truck
      end
    end
  end

  def overstocked_items
    @food_trucks.map do |truck|
      truck.inventory.find_all do |item, quantity|
        if quantity > 50 && food_trucks_that_sell(item).count > 1
          return item 
        end
      end
    end
  end

  def item_names(truck)
  
  end
end
