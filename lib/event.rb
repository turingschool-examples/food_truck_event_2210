require './lib/item'
require './lib/food_truck'

class Event
  attr_reader :name,
              :food_trucks,
              :start_date

  def initialize(name, start_date = nil)
    @name = name
    @food_trucks = []
    @start_date = start_date
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

  def total_inventory
    total_inventory = total_item_quantities
    total_inventory.each do |item,quantity|
      total_inventory[item] = [quantity,food_trucks_that_sell(item)]
    end
    total_inventory
  end

  def sell_quantity(item,quantity)
    return false if total_inventory[item][0] < quantity

    total_inventory[item][1].each do |food_truck|
      while food_truck.check_stock(item) > 0 && quantity > 0
        quantity -= 1
        food_truck.inventory[item] -= 1
      end
    end
    true
  end
end