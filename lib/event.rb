require 'pry'
require './lib/item'
require './lib/food_truck'

class Event
  attr_reader :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    food_trucks << food_truck
  end

  def food_truck_names
    food_trucks.map do |food_truck|
      food_truck.name
    end
  end

  def food_trucks_that_sell(item)
    food = []
    food_trucks.each do |foodtruck|
      foodtruck.inventory.keys.each do |key|
        if key == item
          food << foodtruck
        end
      end
    end
    food
  end

  def food_truck_item_quantity(item)
    quantity = []
    food_trucks.each do |food_truck|
      quantity << food_truck.check_stock(item)
    end
    quantity.compact.sum
  end

  def over_stocked_item?(item)
    x = food_trucks_that_sell(item).count
    if (x > 1) && food_truck_item_quantity(item)
      return true
    else false
    end
  end

  def food_truck_item_names
    item_names = []
    food_trucks.each do |food_truck|
      food_truck.inventory.keys.each do |item|
        item_names << item.info[:name]
      end
    end
    item_names.uniq
  end
end
