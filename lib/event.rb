# frozen_string_literal: true

# This is the Event Class
class Event

  attr_reader :name,
              :food_trucks

  def initialize(name)
    @name           = name
    @food_trucks    = []
  end

  def add_food_truck(truck)
    @food_trucks.push(truck)
  end

  def food_truck_names
    @food_trucks.map { |truck| truck.name }
  end

  def food_trucks_that_sell(item)
    @food_trucks.select { |truck| truck.item?(item) == true }
  end

  def oversold_items
    all_items = @food_trucks.map do |truck|
      truck.inventory.map do |item|
        
      end
    end
    all_items.select{ |item| food_trucks_that_sell(item) }
  end
end
