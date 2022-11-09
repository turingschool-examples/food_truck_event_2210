class FoodTruck
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
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
end
