require './lib/item'
require './lib/food_truck'

class Event
  attr_reader :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(truck)
    food_trucks.push(truck)
  end

  def food_truck_names
    food_trucks.map do |truck|
      truck.name
    end
  end

  def food_trucks_that_sell(item)
    food_trucks.select do |truck|
      truck.inventory.include?(item)
    end
  end

  def find_inventories
    food_trucks.map do |truck|
      truck.inventory
    end
  end

  def merge_inventories
    find_inventories.inject{|item, count| item.merge(count) { |_k, old_count, new_count| old_count + new_count}}
  end

  def list_items
    merge_inventories.find_all do |item|
      item[1] > 50
    end.flatten
  end

  def overstocked_items
    items = list_items.delete_if { |item| item.class == Integer}
    items.select do |item|
      food_trucks_that_sell(item).count >= 2
    end
  end

  def item_names
    merge_inventories.map do |item|
      item[0].name
    end.sort
  end

  def total_inventory
    
    names = merge_inventories.map do |item|
      item[0]
    end

    names.map do |name|
      
      find_truck_names_that_sell(name)
      
    end
    
      
  end

  def find_truck_names_that_sell(item_input)
    merge_inventories.map do |item|
      require 'pry'; binding.pry
      item[0] if item_input == item
    end

  end

end
