class FoodTruck

  attr_reader :name,
              :inventory
  def initialize(name)
    @name      = name
    @inventory = Hash.new({})
  end

  def check_stock(item)
    @inventory[item].count
  end
end
