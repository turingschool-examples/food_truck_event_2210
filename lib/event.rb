class Event
  attr_reader :name,
              :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(truck)
    @food_trucks.push(truck)
  end

  def food_truck_names
    @food_trucks.map do |truck|
      truck.name
    end
  end

  def food_trucks_that_sell(item)
    @food_trucks.select do |truck|
      truck.inventory.include?(item)
    end
  end

  def event_items
    items = []
    @food_trucks.each do |truck|
      truck.inventory.each do |item|
        items << item[0] unless items.include?(item[0])
      end
    end
    items.sort_by do |item|
      item.name
    end
  end

  def over_stocked_items
    overstocked = []
    event_items.each do |item|
      if food_trucks_that_sell(item).count > 1
        total_qty = food_trucks_that_sell(item).sum do |truck|
          truck.check_stock(item)
        end
        overstocked << item if total_qty > 50
      end
    end
    overstocked
  end

  def event_item_names
    event_items.map do |item|
      item.name
    end
  end

  def event_inventory
    inv = {}
    event_items.each do |item|
      total_qty = food_trucks_that_sell(item).sum do |truck|
        truck.check_stock(item)
      end
      trucks = food_trucks_that_sell(item)
      inv[item] = {
        total_qty: total_qty,
        sold_at: trucks
      }
    end
    return inv
  end
end
