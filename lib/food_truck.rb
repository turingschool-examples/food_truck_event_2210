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
    check_stock(item)
    @inventory[item] += qty
  end

  def potential_revenue
    truck_potential_rev = 0
    inventory.each do |item, stock|
        truck_potential_rev += (item.price.sub("$", "").to_f * stock)
    end
    truck_potential_rev
  end

end
