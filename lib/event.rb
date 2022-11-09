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
    @food_trucks.map { |food_truck| food_truck.name }
  end

  def food_trucks_that_sell(item)
    @food_trucks.select do |food_truck|
      food_truck.check_stock(item) > 0
    end
  end

  def duplicated_item?(item)
    trucks_with_item = @food_trucks.find_all do |food_truck|
      food_truck.check_stock(item) > 0
    end
    trucks_with_item.size > 1
  end

  def total_quantity_over_fifty?(item)
    total_inventory[item][0] > 50
  end

  def overstocked_items
    all_items.find_all do |item|
      duplicated_item?(item) && total_quantity_over_fifty?(item)
    end
  end

  def full_menu
    all_items.map do |item|
      item.name
    end.sort
  end

  def all_items
    @food_trucks.flat_map do |food_truck|
      food_truck.inventory.keys.map do |item|
        item
      end
    end.uniq
  end

  def all_items_hash
    items_hash = {}
    all_items.each do |item|
      items_hash[item] = [0, []]
    end
    items_hash
  end

  def total_inventory
    event_inventory = all_items_hash
    @food_trucks.each do |food_truck|
      food_truck.inventory.each do |item, quantity|
        event_inventory[item][0] += quantity
        event_inventory[item][1].push(food_truck)
      end
    end
    event_inventory
  end
end
