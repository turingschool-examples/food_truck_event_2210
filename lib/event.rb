# frozen_string_literal: true

# This is the Event Class
class Event

  attr_reader :name,
              :food_trucks

  def initialize(name)
    @name        = name
    @food_trucks = []
  end

  def add_food_truck(truck)
    @food_trucks.push(truck)
  end

  def food_truck_names
    @food_trucks.map { |truck| truck.name }
  end
end
