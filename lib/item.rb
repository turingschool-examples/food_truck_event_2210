class Item
  attr_reader :name,
              :price,
              :cost
  def initialize(hash)
    @name = hash[:name]
    @price = hash[:price]
    @cost = @price.gsub(/[^\d\.]/, '').to_f
  end
end
