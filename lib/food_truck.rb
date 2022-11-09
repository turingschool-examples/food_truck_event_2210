class FoodTruck
  attr_reader :name,
              :inventory
  def initialize(name)
    @name = name
    @inventory = Hash.new(0) #or { |hash, key| hash[key] = 0 }
  end
  
  def check_stock(item)
    @inventory[item]
  end
  
  def stock(item, quantity)
    @inventory[item] += quantity
  end
  
  def potential_revenue
    @inventory.keys.map {|item| item.cost * inventory[item]}.sum
  end
end
