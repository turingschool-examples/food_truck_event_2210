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
    food_trucks.map { |food_truck| food_truck.name }
  end

  def food_trucks_that_sell(item)
    food_trucks.find_all { |food_truck| food_truck.check_stock(item) > 0}
  end

  def overstocked_items
    items = []
    @food_trucks.each do |food_truck|
      food_truck.inventory.each do |item, quantity|
        total_quantity = food_trucks_that_sell(item).map { |food_truck| food_truck.check_stock(item) }.sum
        if food_trucks_that_sell(item).count > 1 && total_quantity > 50
          items.push(item)
        end
      end
    end
    items.uniq
  end
end
