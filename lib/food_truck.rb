class FoodTruck

  require 'time'

  attr_reader :name,
              :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def stock(item, qty = 0)
    @inventory[item] ||= 0
    @inventory[item] += qty
  end

  def check_stock(item)
    return 0 if @inventory[item].nil?
    @inventory[item]
  end

  def potential_revenue
    @inventory.sum do |item, qty|
      (item.price[1..].to_f * qty).round(2)
    end
  end

  def items_sold_by_name
    inventory.map do |item|
      item[0].name
    end
  end
end
