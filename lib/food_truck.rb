require 'pry'

class FoodTruck
    attr_reader :name,
                :inventory
  def initialize (name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    if !@inventory.include?(item)
      @inventory[item] = 0
    else
      @inventory[item]
    end
  end

  def stock(item, qty)
    @inventory[item] += qty
  end

end
