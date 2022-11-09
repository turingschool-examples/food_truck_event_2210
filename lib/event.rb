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
    @food_trucks.map do |truck|
      truck.name
    end
  end

  def food_trucks_that_sell(check_item)
    trucks_with_item = []
    @food_trucks.each do |truck|
      truck.inventory.each do |item, amount|
        if item == check_item
          trucks_with_item << truck
        end
      end
    end
    trucks_with_item
  end
end
