require 'pry'
require './lib/item'
require './lib/food_truck'

class Event
  attr_reader :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    food_trucks << food_truck
  end

  def food_truck_names
    food_trucks.map do |food_truck|
      food_truck.name
    end
  end

  # def find_all_foodtrucks
  #   food_trucks.find_all do |foodtruck|
  #     foodtruck.inventory.keys.find_all do |key|
  #       key.info[:name] == item[:name]
  #     end
  #   end
  # end

  def food_trucks_that_sell(item)
    food = []
    food_trucks.each do |foodtruck|
      foodtruck.inventory.keys.each do |key|
        if key == item
          food << foodtruck
        end
      end
    end
    food
  end
end
