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
    inventory[item] += amount
  end

  def potential_revenue
    #sum of all their items price * quantity
    inventory.keys.map do |key|
      # require 'pry' ; binding.pry
      key.price
    end
  end
end
