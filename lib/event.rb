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
    @food_trucks.map(&:name)
  end

  def food_trucks_that_sell(item)
    @food_trucks.find_all do |truck|
      truck.inventory[item] > 0
    end
  end

  def available_item_names
    item_names = []

    inventories = @food_trucks.map do |truck|
      truck.inventory
    end.delete_if(&:empty?)
    
    items = inventories.each do |item, count|
      item_names << item
    end
    
    items.flat_map do |item|
      item.keys
    end.map do |array|
      array.name
    end.sort.uniq
  end
end
