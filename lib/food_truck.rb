class FoodTruck
  attr_reader :name,
              :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  # def inventory
  #   {}
  # end

  def check_stock(item)
    inventory[item].to_i
  end

  def stock(item, quantity)
    inventory[item] = inventory[item].to_i + quantity
  end
  
end
