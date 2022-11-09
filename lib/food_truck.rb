class FoodTruck
  attr_reader :name, :inventory
  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    @inventory[item]
  end

  def stock(item, quantity)
    if @inventory[item] == nil
      @inventory[item] = quantity
    else
      @inventory[item] += quantity
    end
  end

  def potential_revenue
    @inventory.sum do |item, quantity|
      item.price * quantity
    end
  end

  def overstocked
    @inventory.map do |item|
  end

  def all_event_items
    
  end
end
