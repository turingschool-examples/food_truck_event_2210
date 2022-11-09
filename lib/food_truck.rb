class FoodTruck
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end


  def check_stock(item_object)
    @inventory[:item_object]
  end

  #def transform_amount(item_object, amount)
  #@inventory = {item_object: amount}.transform_values {|v| v + amount}
#end

  def stock (item_object, amount)
    new_stock_value = @inventory.merge!({item_object: amount})
    #if item_object == item_object
    #@inventory = {item_object: amount}.transform_values {|v| v + amount}
  #end
  end
end
