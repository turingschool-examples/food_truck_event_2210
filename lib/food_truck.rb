class FoodTruck
  attr_reader :name,
              :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    @inventory[item]
  end

  def stock(item, quantity)
    @inventory[item] += quantity
  end

  def potential_revenue
    all_prices = 0
    @inventory.each do |item, quantity|
      all_prices += (item.price * quantity)
    end
    all_prices
  end
end
