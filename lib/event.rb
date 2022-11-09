class Event
  attr_reader :name, :food_trucks
  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    food_trucks.push(food_truck)
  end

  def food_truck_names
    food_trucks.map { |food_truck| food_truck.name}
  end

  def food_trucks_that_sell(item)
    food_trucks.find_all do |food_truck|
      food_truck.check_stock(item) != 0
    end
  end

  def event_items
    event_item_hash = {}
    food_trucks.each do |food_truck|
      food_truck.inventory.each do |item, quantity|
        if event_item_hash.keys.include?(item)
          event_item_hash[item] += quantity
        else
          event_item_hash[item] = quantity
        end
      end
    end
    event_item_hash
  end

  def overstocked_items
    event_items.filter_map do |item, quantity|
      item if food_trucks_that_sell(item).length > 1 && quantity > 50
    end
  end
end
