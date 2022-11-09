class FoodTruck
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end 

  def check_stock(item)
   stock = 0
   if @inventory.include?(item)
   stock_count = @inventory[item]
   stock += stock_count
   end 
   stock
  end 
  
  def stock(item, count)
    if inventory.include?(item)
      inventory[item] += count
    else
      @inventory[item] = count
    end 
  end 
end
