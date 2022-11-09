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
    items = []
    @food_trucks.each do |food_truck|
      food_truck.inventory.each do |item, quantity|
        total_quantity = food_trucks_that_sell(item).map { |food_truck| food_truck.check_stock(item) }.sum
        items.push(item) if (food_trucks_that_sell(item).count > 1 && total_quantity > 50)
      end
    end
    items.uniq
  end

  def all_items
    item_names = []
    @food_trucks.each do |food_truck|
      truck_items = food_truck.inventory.map { |item, quantity| item.name }
      item_names.push(truck_items)
    end
    item_names.flatten.sort.uniq
  end

  def all_item_objects
    all_items_offered = []
    @food_trucks.each do |food_truck|
      truck_items = food_truck.inventory.map { |item, quantity| item }
      all_items_offered.push(truck_items)
    end
    all_items_offered = all_items_offered.flatten.uniq
  end

  def total_inventory
    items = all_item_objects
    inventory = {}
    items.each do |item|
      total_quantity = food_trucks_that_sell(item).map { |food_truck| food_truck.check_stock(item) }.sum
      inventory[item] = [total_quantity, food_trucks_that_sell(item)]
    end
    inventory
  end
end
