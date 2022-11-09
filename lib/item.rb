class Item
  attr_reader :name,
              :price

  def initialize(item_data)
    @name = item_data[:name]
    @price = item_data[:price]
  end

  def price_to_float
    @price[1..@price.length].to_f
  end
end
