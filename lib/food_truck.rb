class FoodTruck

  attr_reader :name,
              :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    if inventory[item] == nil
      return 0
    else
      return inventory[item]
    end
  end

  def stock(item, quantity)
    if inventory[item] == nil
      inventory[item] = quantity
    else
      inventory[item] += quantity
    end
  end

  def potential_revenue
    inventory.map do |item, quantity|
      item.price * quantity
    end.sum
  end
end
