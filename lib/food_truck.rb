class FoodTruck

  attr_reader :name,
              :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    if key_match(item)
      inventory[item]
    else
      0
    end 
  end

  def key_match(item)
    inventory.keys.any? do |key|
      key = item
    end
  end

  def stock(item, amount)
    # require 'pry' ; binding.pry
    inventory[item] += amount

  end
end
