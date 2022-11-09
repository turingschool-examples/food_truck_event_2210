class FoodTruck

  attr_reader :name,
              :inventory,
              :check_stock

  def initialize(name)
    @name = name
    @check_stock = []
  end

  def inventory
    @inventory = Hash.new{}
  end

  def check_stock(item)
    check_stock = []
  end
end
