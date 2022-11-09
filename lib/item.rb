class Item
  attr_reader :name, :price

  def initialize (item_hash)
    @name = item_hash[:name]
    @price = item_hash[:price]
  end

  def convert_price
    @price.delete("$").to_f.round(2)
  end
end
