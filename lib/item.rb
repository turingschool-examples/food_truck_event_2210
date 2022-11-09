class Item
  attr_reader :name, :price, :quantity

  def initialize(item_data)
    @name = item_data[:name]
    @price = set_price(item_data[:price])
    @quantity = item_data[:quantity]
  end

  def set_price(price)
    price.delete('$').to_f
  end
end
