class FoodTruck
  attr_reader :name, :inventory

  def initialize(info)
    @name = info
    @inventory = {}
  end
end
