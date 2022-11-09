class FoodTruck
  attr_reader :name, :inventory

  def initialize(name)
    @name       = name
    @inventory  = {}
  end

  def check_stock(item)
    if inventory.count == 0
      0
    else
      inventory[item]
    end
  end

  def stock(item, quantity)
    if inventory[item] != nil
      inventory[item] += quantity
    else
      inventory[item] = quantity
    end
  end

  def potential_revenue
    inventory.sum do |item|
      remove_dollar_sign(item[0].price).to_f * inventory[item[0]]
    end
  end

  def remove_dollar_sign(price)
    price.delete "$"
  end

  

end
