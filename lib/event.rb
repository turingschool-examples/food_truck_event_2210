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
      food_truck.check_stock(item) > 0
    end
  end

  def total_item_quantity(item)
    @food_trucks.map do |food_truck|
      food_truck.check_stock(item)
    end.sum
  end

  def all_event_items
    @food_trucks.flat_map do |food_truck|
      food_truck.inventory.keys
    end.uniq
  end

  def overstocked_items 
    all_event_items.find_all do |item|
      (total_item_quantity(item) > 50) && 
      (food_trucks_that_sell(item).length > 1)
    end
  end
end
