class FoodTruck
  attr_reader :name,
              :item

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    @item = 0
  end

  def stock(item, amount)
    @inventory.push(item, amount)
  end
end
