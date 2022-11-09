class FoodTruck
  attr_reader :name,
              :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    inventory[item]
  end

  def stock(item, quantity)
    if inventory.key?(item)
      inventory[item] += quantity
    else 
      inventory[item] = quantity
    end
  end

  def potential_revenue
    @inventory.map do |item, quantity|
      item.price * quantity
    end.sum
  end

  def items
    @inventory.keys
  end
end
