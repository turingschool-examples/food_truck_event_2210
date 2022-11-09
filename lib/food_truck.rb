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

  def stock(item_object, amount)
    if @inventory[item_object] == nil
      @inventory.merge!({item_object: amount})
    else
      new_amount = @inventory[item_object] += amount
      @inventory.merge!({item_object: new_amount})
    end
  end

  # def potential_revenue
  #   inventory.sum do |item, amount|
  #     item.price * amount
  #   end
  # end

end
