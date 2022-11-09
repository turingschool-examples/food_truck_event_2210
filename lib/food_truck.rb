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

  def stock(item, new_quantity)
    if @inventory[item] == NIL
      @inventory[item] = new_quantity
    elsif @inventory[item] != NIL 
      @inventory[item] += new_quantity 
    end
  end 
end
