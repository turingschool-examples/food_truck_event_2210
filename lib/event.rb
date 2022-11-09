class Event
    attr_reader :name,
                :food_trucks
  def initialize(name)
    @name = name
    @food_trucks = []
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
    @food_trucks.filter_map do |food_truck|
        if food_truck.inventory.include?(item)
        food_truck
        end
    end
  end

#   def overstocked
#     if food_trucks_that_sell
#   end

  def all_items
    all = food_trucks.flat_map do |food_truck|
        food_truck.inventory.map do |item, stock|
            item.name
        end
    end
    all.sort.uniq
  end

end
