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
    sellers = food_trucks.find_all do |food_truck|
      food_truck.inventory.include?(item)
    end
    sellers
  end
  
  def sorted_item_list
    sorted_list = []
    @food_trucks.each do |food_truck|
      food_truck.inventory.map do |item, quantity|
        sorted_list << item.name
      end
    end
    sorted_list.uniq.sort
  end

  # def overstocked_items
  #   items = []
  #   item_quantity = []
  #   @food_trucks.each do |food_truck|
  #     food_truck.inventory.map do |item, quantity|
  #       items << item
  #       item_quantity << quantity
  #     end
  #     items
  #     item_quantity
  #     require 'pry'; binding.pry
  #   end
  # end
end
