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
    food_trucks.map { |food_truck| food_truck.name }
  end

  def food_trucks_that_sell(item)
    food_trucks.find_all { |food_truck| food_truck.check_stock(item) > 0}
  end

  def overstocked_items
    items = all_item_objects.find_all { |item| total_quantity(item) > 50 && food_trucks_that_sell(item).count > 1}
    items.uniq
  end

  def all_items
    item_names = all_item_objects.map { |item| item.name}
    item_names.sort
  end

  def all_item_objects
    all_items_offered = []
    @food_trucks.each do |food_truck|
      truck_items = food_truck.inventory.map { |item, quantity| item }
      all_items_offered.push(truck_items)
    end
    all_items_offered.flatten.uniq
  end

  def total_quantity(item)
    total_quantity = food_trucks_that_sell(item).map { |food_truck| food_truck.check_stock(item) }.sum
  end

  def total_inventory
    inventory = {}
    all_item_objects.each do |item|
      inventory[item] = [total_quantity(item), food_trucks_that_sell(item)]
    end
    inventory
  end
end
