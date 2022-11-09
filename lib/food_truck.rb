class FoodTruck
  attr_reader :name, :inventory

  def initialize(info)
    @name = info
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    inventory[item]
  end

  def stock(item, quantity)
    inventory[item] += quantity
  end
end
