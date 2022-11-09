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
    @food_trucks.map do |truck|
      truck.name
    end
  end

  def food_trucks_that_sell(item)
    @food_trucks.find_all do |truck|
      truck.inventory.keys.include?(item)
    end
  end

  def total_inventory
    all_inventory = Hash.new(0)
    @food_trucks.each do |truck|
      truck.inventory.each do |item, quantity|
        if all_inventory.keys.include?(item)
          all_inventory[item] += quantity
        else
          all_inventory[item] = quantity
        end
      end
    end
    all_inventory.map do |item, quantity|
      all_inventory[item] = [quantity, food_trucks_that_sell(item)]
    end
    all_inventory
  end

  def item_names
    total_inventory.keys.map do |item|
      item.name
    end.sort
  end
end