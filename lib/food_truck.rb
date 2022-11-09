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

  def potential_revenue
    hash = inventory.transform_keys do |item|
      item.price
    end.to_a
    hash.sum { |price| price[0] * price[1] }
  end
end
