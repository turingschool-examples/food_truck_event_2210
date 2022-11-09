class Event

  attr_reader :name,
              :food_trucks

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
    food_trucks.find_all do |trucks|
      trucks.inventory[item] > 0
    end
  end

  # def potential_revenue
  #   #sum of all their items price * quantity
  #   food_truck.each do |truck|
  #     truck.
  # end
end
