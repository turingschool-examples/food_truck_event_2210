class Item
  attr_reader :name,
              :price

  def initialize(attributes)
    @name = attributes[:name]
    @price = attributes[:price]
  end

  def price_float
    price.tr("$",'').to_f
  end
end
