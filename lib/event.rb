class Event
  attr_reader :name,
              :food_trucks
  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(truck)
    @food_trucks << truck
  end

  def food_truck_names
    @food_trucks.map do |truck|
      truck.name
    end
  end

  def food_trucks_that_sell(item)
    item_arr = []
    @food_trucks.each do |truck|
      if truck.inventory.include?(item)
        item_arr << truck
      end
    end
    item_arr
  end

  def total_inventory
    total_inventory = Hash.new(0)
    @food_trucks.each do |truck| 
      truck.inventory.each do |item, amount| 
        if total_inventory.keys.include?(item) 
          total_inventory[item][:quantity] += amount
        else 
          total_inventory[item] = {quantity: amount, food_trucks: food_trucks_that_sell(item)}
        end
      end 
    end 
    total_inventory 
  end


  def overstocked_items
    total_inventory.select do |item, details| 
      # require 'pry'; binding.pry
      details[:quantity] > 50 && details[:food_trucks].length >= 2
    end.keys 
  end


  def sorted_list
    total_inventory.keys.map do |item|
      item.name
    end.sort
  end
end
