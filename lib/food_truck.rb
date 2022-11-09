# frozen_string_literal: true

# This is the FoodTruck Class
class FoodTruck

  attr_reader :name,
              :inventory

  def initialize(name)
    @name      = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    @inventory[item]
  end

  def stock(item, quantity)
    @inventory[item] += quantity
  end

  def item?(item)
    @inventory.include?(item)
  end
  
  def potential_revenue
    @inventory.sum { |item, quantity| item.price * quantity.to_f}
  end
end
