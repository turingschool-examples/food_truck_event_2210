class FoodTruck
  attr_reader :name,
              :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new
  end

  def check_stock(item)
    if @inventory[item] == nil
       0
    else
      @inventory[item]
    end
  end

  def stock(item, quantity)
    if @inventory[item].nil?
      @inventory[item] = quantity
    else
      @inventory[item] += quantity
    end
  end

   def potential_revenue
    inventory.sum do |item, quantity|
      item.price * quantity
      # require 'pry'; binding.pry
    end
  end
end
