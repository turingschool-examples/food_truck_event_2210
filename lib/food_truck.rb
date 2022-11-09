require 'pry'

class FoodTruck
    attr_reader :name,
                :inventory
  def initialize (name)
    @name = name
    @inventory = {}
  end

#   def stock(item, qty = 0)
#     @inventory[item]
#     binding.pry
#   end

  def check_stock(item)
    if !@inventory.include?(item)
    return 0
    end
  end

end
