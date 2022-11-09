class Item
  attr_reader :name, :price

  def initialize(attributes)
    @name = attributes[:name]
    @price = clean_price(attributes[:price])
  end

  def clean_price(price)
    price[1..-1].to_f.round(2)
  end
end
