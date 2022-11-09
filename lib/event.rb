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
    names = @food_trucks.map do |food_truck|
      food_truck.name
    end
  end

  def food_trucks_that_sell(item)
    selling_food_trucks = @food_trucks.find_all do |food_truck|
      food_truck.inventory.include?(item)
    end
    selling_food_trucks
  end

  def total_inventory
    inventory_hash = Hash.new
    @food_trucks.each do |food_truck|
      food_truck.inventory.each do |item, quantity|
        if inventory_hash[item].nil?
          inventory_hash[item] = Hash.new
        end
        if inventory_hash[item][:quantity].nil?
          inventory_hash[item][:quantity] = quantity
        else
          inventory_hash[item][:quantity] += quantity
        end
        if inventory_hash[item][:food_trucks].nil?
          inventory_hash[item][:food_trucks] = [food_truck]
        else
          inventory_hash[item][:food_trucks] << food_truck
        end
      end
    end
    inventory_hash
  end

  def sorted_item_list
  end

  def overstocked_items 
    
  end
end
