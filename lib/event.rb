class Event
  attr_reader :name, :food_trucks

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
    @food_trucks.select { |food_truck| food_truck.sells?(item) }
  end

  def all_items
    @food_trucks.flat_map { |food_truck| food_truck.all_items }.uniq
  end

  def total_quantity(item)
    @food_trucks.sum { |food_truck| food_truck.check_stock(item) }
  end

  def overstocked_items
    all_items.select do |item|
      food_trucks_that_sell(item).length > 1 && total_quantity(item) > 50
    end
  end

  def all_items_by_name
    all_items.map { |item| item.name }.sort
  end
end
