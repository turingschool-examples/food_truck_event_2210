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
    @food_trucks.map do |food_truck|
      food_truck.name
    end
  end

  def food_trucks_that_sell(item)
    @food_trucks.select do |food_truck|
      food_truck.check_stock(item) > 0
    end
  end

  def overstocked_items
    #needs a total inventory tally first
  end

  def total_inventory
    total = {}
    @food_trucks.each do |food_truck|
      food_truck.inventory.each do |item, quantity|
        total[item] = {quantity: 0, food_trucks: []} if total[item].nil?
        total[item][:quantity] += quantity
        total[item][:food_trucks] << food_truck
      end
    end
    total
  end
end
