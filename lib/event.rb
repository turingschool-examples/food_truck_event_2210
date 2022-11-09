class Event
  attr_reader :name,
              :food_trucks
  
  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks.push(food_truck)
  end

  def food_truck_names
    @food_trucks.map do |food_truck|
      food_truck.name
    end
  end
  
  def food_trucks_that_sell(item)
    @food_trucks.find_all do |food_truck|
      !food_truck.inventory[item].nil?
    end
  end

  def overstocked_items
    # sold by more than 1 food truck && total quantity is > 50
  end

  def names_of_all_items
    # list sorted alphabetically, no duplicates
    # array.sort_by.uniq
  end

  def total_inventory
    # hash of all items, total quantity, and which food_trucks have item
    # 
  end
end
