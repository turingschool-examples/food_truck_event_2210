require './lib/item'
require './lib/food_truck'

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
    @food_trucks.map { |food_truck| food_truck.name}
  end

  def food_trucks_that_sell(item)
    @food_trucks.find_all do |food_truck|
      food_truck.inventory[item] > 0
    end
  end

  def overstocked_items
    overstocked_items = []
    total_item_quantities.each do |item|
      if item[1] > 50 && food_trucks_that_sell(item[0]).count > 1
        overstocked_items << item[0]
      end
    end
    overstocked_items
  end

  def total_item_quantities
    total_item_quantities = Hash.new(0)
    @food_trucks.each do |food_truck|
      food_truck.inventory.each do |item,quantity|
        total_item_quantities[item] += quantity
      end
    end
    total_item_quantities
  end

  def item_names
    items = []
    @food_trucks.each do |food_truck|
      food_truck.inventory.each do |item,quantity|
        items << item
      end
    end
    items.map! {|item| item.name}
    items.uniq.sort
  end
end