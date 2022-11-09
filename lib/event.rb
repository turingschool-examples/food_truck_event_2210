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

  def overstocked_items
    # items = {}
    # @food_trucks.each do |food_truck|
    # end
    #check if two food trucks have the same item
    # if they do check the quantity of those items
    # if total quantity is over 50 add to array
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
    # creates a hash with items as keys and values
    # is array with qty in first element and nested array as second element
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
