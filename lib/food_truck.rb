class FoodTruck
  attr_reader :name,
              :inventory
  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    if @inventory[item] == NIL
      @inventory[item] = 0
    else @inventory[item]
    end
  end

  def stock(item, new_qty)
    if @inventory[item] == NIL
      @inventory[item] = new_qty
    elsif @inventory[item] != NIL 
      @inventory[item] += new_qty 
    end
  end
  
  def potential_revenue
    @inventory.sum do |item, qty|
     item.price * qty
    end
  end
end
