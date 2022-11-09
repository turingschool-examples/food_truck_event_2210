require './lib/item'
require './lib/food_truck'

class FoodTruck
  attr_reader   :name
  attr_accessor :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    @inventory[item]
  end

  def stock(item,quantity)
    @inventory[item] += quantity
  end

  def potential_revenue
    @inventory.sum do |item,quantity|
      item.price_float * quantity
    end
  end
end
