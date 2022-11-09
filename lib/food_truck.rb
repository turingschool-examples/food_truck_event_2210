class FoodTruck
  attr_reader :name, :inventory

  def initialize(name, inventory = 0)
    @name = name
    @inventory = {}
  end

  def check_stock(item_object)
    stock = @inventory.count
  end
end
