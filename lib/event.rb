class Event
  attr_reader :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(truck)
    food_trucks << truck
  end

  def food_truck_names
    food_trucks.map do |truck|
      truck.name
    end
  end

  def food_trucks_that_sell(item)
    food_trucks.find_all do |truck|
      truck.inventory.has_key?(item)
    end
  end

  def overstocked_items
    items = food_trucks.flat_map do |truck|
      truck.inventory.keys
    end.uniq
    items.delete_if do |item|
      food_trucks_that_sell(item).count == 1
    end
    items.delete_if do |item|
      quantity = food_trucks_that_sell(item).sum do |truck|
        truck.check_stock(item)
      end
      quantity <= 50
    end
  end

  def menu
    items = food_trucks.flat_map do |truck|
      truck.inventory.keys
    end.uniq
    items.map { |item| item.name }.sort
  end
end
