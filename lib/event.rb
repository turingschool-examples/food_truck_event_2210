# frozen_string_literal: true

# This is the Event Class
class Event

  attr_reader :name,
              :food_trucks

  def initialize(name)
    @name        = name
    @food_trucks = []
  end
end
