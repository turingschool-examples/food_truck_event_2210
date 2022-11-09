class FoodTruck
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    return 0 unless @inventory[item]
    @inventory[item]
  end

  def stock(item, amount)
    @inventory[item] = amount
  end

  def potential_revenue
    @inventory.sum do |item, amount|
      item.price_to_f * amount
    end
  end

  def sells?(item)
    !!@inventory[item]
  end
end
