class FoodTruck
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end


  def check_stock(item_object)
    @inventory[:item_object]
  end

  def stock (item_object, amount)
    @inventory.merge!({item_object: amount})
  end
end
