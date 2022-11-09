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
    @food_trucks.map do |truck|
      truck.name
    end
  end

  def food_trucks_that_sell(item)
    @food_trucks.find_all do |truck|
      truck.inventory.include?(item)
    end
  end

  def overstocked_items
    food_truck_inventory = @food_trucks.map do |truck|
      truck.inventory
    end
    items = []
    food_truck_inventory.each do |inventory|
      items << inventory.keys
    end
    items.flatten!
    duplicate_items = items.select do |item|
      items.count(item) > 1
    end
    tracker = Hash.new(0)
    food_truck_inventory.each do |inventory|
      duplicate_items.each do |item|
        tracker[item] += inventory[item]
      end
    end
    dupes_over_50 = []
    tracker.each do |item, quantity|
      if quantity > 50 
        dupes_over_50 << item 
      end
    end
    dupes_over_50
  end

  def item_names
    food_truck_inventory = @food_trucks.map do |truck|
      truck.inventory
    end
    items = []
    food_truck_inventory.each do |inventory|
      inventory.keys.each do |item|
        items << item.name
      end
    end
    items.uniq.sort 
  end

  def total_inventory
    food_truck_inventory = @food_trucks.map do |truck|
      truck.inventory
    end
    items = []
    food_truck_inventory.each do |inventory|
      items << inventory.keys
    end
    items.flatten!
    final_hash = {}
    items.each do |item|
      total_quantity = 0
      final_hash[item] = {}
      @food_trucks.each do |truck|
        total_quantity += truck.check_stock(item)
      end
      final_hash[item][:trucks] = food_trucks_that_sell(item)
      final_hash[item][:total_quantity] = total_quantity 
    end
    final_hash
  end
end