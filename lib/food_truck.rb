require 'pry'
require './lib/item'

class FoodTruck
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def add_item(item)
    inventory[item] = item.stock
  end

  def check_stock(item)
  inventory[item]
  end

  def stock(item, amount)
  inventory[item] += amount
  end

  def potential_revenue
    total = []
      inventory.each do |item, quantity|
        total << item.info[:price].delete("$").to_f * quantity
      end
    total.sum
  end
end
