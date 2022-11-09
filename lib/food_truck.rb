class FoodTruck
  attr_reader :name,
              :inventory
  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
    # { |hash, key| hash[key] = 0 }
  end
  
  def check_stock(item)
    @inventory[item]
  end
  
  def stock(item, quantity)
    if @inventory[item] = 0
      @inventory[item] = quantity
    # elsif 
    #   require 'pry';binding.pry
    end
    
  end
end
