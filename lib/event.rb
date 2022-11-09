class Event
  attr_reader :name,
              :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []    
  end

  def food_truck_names
    # iterate over the food trucks and return an array of their names
  end

end
