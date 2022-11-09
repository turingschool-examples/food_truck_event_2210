require 'time'

class Event
  attr_reader :name,
              :food_trucks,
              :start_date
  
  def initialize(name, start_date = nil)
    @name = name
    @food_trucks = []
    @start_date = (Time.parse(start_date) if !start_date.nil?)
  end

  def add_food_truck(food_truck)
    @food_trucks.push(food_truck)
  end

  def food_truck_names
    @food_trucks.map do |food_truck|
      food_truck.name
    end
  end
  
  def food_trucks_that_sell(item)
    @food_trucks.find_all do |food_truck|
      !food_truck.inventory[item].nil?
    end
  end

  def list_all_items
    all_items = @food_trucks.flat_map do |food_truck|
      food_truck.inventory.keys
    end
    all_items.uniq
  end

  def total_quantity_of_item(item)
    food_trucks.sum do |food_truck|
      food_truck.check_stock(item)
    end
  end

  def overstocked_items
    list_all_items.find_all do |item|
      food_trucks_that_sell(item).length > 1 && total_quantity_of_item(item) > 50
    end
  end

  def names_of_all_items
    all_item_names = list_all_items.map do |item|
      item.name
    end
    all_item_names.sort
  end

  def total_inventory
    total_inventory_hash = {}
    list_all_items.each do |item|
      total_inventory_hash[item] = [total_quantity_of_item(item), food_trucks_that_sell(item)]
    end
    total_inventory_hash
  end

  def first_truck_sale(item, quantity)
    food_truck = food_trucks_that_sell(item)[0]
    if quantity >= food_truck.check_stock(item)
    remainder = quantity - food_truck.check_stock(item)
    food_truck.sell(item, food_truck.check_stock(item))
    next_truck_sale(item, remainder)
    else quantity <= food_truck.check_stock(item)
      food_truck.sell(item, quantity)
    end 
  end

  def next_truck_sale(item, remainder)
    food_truck = food_trucks_that_sell(item)[1]
    if remainder >= food_truck.check_stock(item)
    remainder = remainder - food_truck.check_stock(item)
    food_truck.sell(item, food_truck.check_stock(item))
    else remainder <= food_truck.check_stock(item)
      food_truck.sell(item, remainder)
    end 
  end

  def sell_item(item, quantity)
    return false if quantity > total_quantity_of_item(item)
    first_truck_sale(item, quantity)
    true
  end  
end
