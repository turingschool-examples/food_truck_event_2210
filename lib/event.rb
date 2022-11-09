class Event
  attr_reader :name, :food_trucks, :start_date

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    @food_trucks.map { |food_truck| food_truck.name }
  end

  def food_trucks_that_sell(item)
    @food_trucks.select { |food_truck| food_truck.sells?(item) }
  end

  def all_items
    @food_trucks.flat_map { |food_truck| food_truck.all_items }.uniq
  end

  def total_quantity(item)
    @food_trucks.sum { |food_truck| food_truck.check_stock(item) }
  end

  def overstocked_items
    all_items.select do |item|
      food_trucks_that_sell(item).length > 1 && total_quantity(item) > 50
    end
  end

  def all_items_by_name
    all_items.map { |item| item.name }.sort
  end

  def item_index
    hash = {}
    all_items.each do |item|
      hash[item] = {
        total_quantity: total_quantity(item),
        sold_by: food_trucks_that_sell(item)
      }
    end
    hash
  end

  def sell_item(item, amount)
    return false if total_quantity(item) < amount
    @food_trucks.each do |food_truck|
      if amount > food_truck.inventory[item]
        amount -= food_truck.inventory[item]
        food_truck.stock(item, 0)
      else
        food_truck.stock(item, food_truck.inventory[item] - amount)
        amount = 0
      end
      break if amount.zero?
    end
    true
  end

  def start_date
    @start_date = format_time_to_string(Time.new(2022, 01, 01))
  end

  def format_time_to_string(time)
    time.strftime('%d/%m/%Y')
  end
end
