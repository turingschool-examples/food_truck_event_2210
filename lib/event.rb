class Event
  attr_reader :name,
              :food_trucks
  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    @food_trucks.map do |food_truck|
      food_truck.name
    end
  end

  def food_trucks_that_sell(item)
    @food_trucks.select do |food_truck|
      food_truck.check_stock(item) > 0
    end
  end

  def all_event_items
    all_inventory.keys.map do |item| 
      item.name
    end.sort
  end

  def all_inventory
    total_inventory = {}
    food_trucks.each do |food_truck|
      food_truck.inventory.each do |item, qty|
        if total_inventory.keys.include?(item)
          total_inventory[item] += qty
        else total_inventory[item] = qty
        end
      end
    end
    total_inventory
  end

  def overstocked_items

  end
end
