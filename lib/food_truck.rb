class FoodTruck
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def stock(item, count)
    @inventory[item] += count
  end

  def check_stock(item)
    @inventory[item]
  end

  def potential_revenue
    revenue = 0
    @inventory.each do |item, count|
      revenue += (item.price * count)
    end
    revenue.round(2)
  end
end
