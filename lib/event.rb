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
    items.map { |item| item.name }.sort
  end

  def inventory
    inventory = Hash[(items.map do |item|
                        [item, inventory_values(item)]
                      end)]
    inventory.transform_values! { |v| v.flatten }
    inventory.delete_if { |_k, v| v[0] == 0 }
  end

  def inventory_values(item)
    [total_quantity(item), list_trucks_that_sell(item)]
  end

  def list_trucks_that_sell(item)
    food_trucks_that_sell(item).flat_map do |truck|
      truck.name
    end
  end

  def total_quantity(item)
    food_trucks_that_sell(item).sum do |truck|
      truck.check_stock(item)
    end
  end

  def items
    items = food_trucks.flat_map do |truck|
      truck.inventory.keys
    end.uniq
  end

  def sell_bulk(item, n)
    n <= inventory[item][0]
  end
end
