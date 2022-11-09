class FoodTruck
  attr_reader :name,
              :items

  def initialize(name)
    @name = name
    @inventory = {}
  end
end
