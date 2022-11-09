require './lib/event'

describe Event do
  let(:item1) {Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})}
  let(:item2) {Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})}
  let(:item3) {Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})}
  let(:item4) {Item.new({name: "Banana Nice Cream", price: "$4.25"})}
  let(:food_truck1) {FoodTruck.new("Rocky Mountain Pies")}
  let(:food_truck2) {FoodTruck.new("Ba-Nom-a-Nom")}
  let(:food_truck3) {FoodTruck.new("Palisade Peach Shack")}
  let(:event) {Event.new("South Pearl Street Farmers Market")}

  it 'exists and has attributes' do
    expect(event.name).to eq("South Pearl Street Farmers Market")
    expect(event.food_trucks).to eq([])
  end

  describe '#add_food_truck' do
    it 'adds a FoodTruck to Event' do
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)

      expect(event.food_trucks).to eq([food_truck1,food_truck2,food_truck3])
    end
  end

  describe '#food_truck_names' do
    it 'returns an array of FoodTruck names' do
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)

      expect(event.food_truck_names).to eq(["Rocky Mountain Pies", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
    end
  end

  describe '#food_trucks_that_sell' do
    it 'returns an array of FoodTruck objects that sell item' do
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)
      food_truck1.stock(item1, 35)
      food_truck1.stock(item2, 7)
      food_truck2.stock(item4, 50)
      food_truck2.stock(item3, 25)
      food_truck3.stock(item1, 65)

      expect(event.food_trucks_that_sell(item1)).to eq([food_truck1,food_truck3])
      expect(event.food_trucks_that_sell(item4)).to eq([food_truck2])
    end
  end

  describe '#overstocked_items' do
    it 'returns items sold by >1 food trucks and have quantity >50' do
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)
      food_truck1.stock(item1,35)
      food_truck2.stock(item1,35)
      food_truck3.stock(item2,55)

      expect(event.overstocked_items).to eq([item1])
    end
  end

  describe '#total_item_quantities' do
    it 'returns a hash of each item quantity across all food trucks' do
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)
      food_truck1.stock(item1, 35)
      food_truck1.stock(item2, 7)
      food_truck2.stock(item4, 50)
      food_truck2.stock(item3, 25)
      food_truck3.stock(item1, 65)

      expect(event.total_item_quantities).to eq({item1 => 100, item2 => 7, item3 => 25, item4 => 50})
    end
  end

  describe '#item_names' do
    it 'returns a list of all items sold alphabetically' do
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)
      food_truck1.stock(item1, 35)
      food_truck1.stock(item2, 7)
      food_truck2.stock(item4, 50)
      food_truck2.stock(item3, 25)
      food_truck3.stock(item1, 65)

      expected = ['Apple Pie (Slice)','Banana Nice Cream','Peach Pie (Slice)','Peach-Raspberry Nice Cream']

      expect(event.item_names).to eq(expected)
    end
  end

  describe '#total_inventory' do
    it 'returns a hash of each item total quantity and which food trucks sell it' do
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)
      food_truck1.stock(item1, 35)
      food_truck1.stock(item2, 7)
      food_truck2.stock(item4, 50)
      food_truck2.stock(item3, 25)
      food_truck3.stock(item1, 65)

      expected = {
                  item1 => [100,[food_truck1,food_truck3]],
                  item2 => [7,[food_truck1]],
                  item3 => [25,[food_truck2]],
                  item4 => [50,[food_truck2]]
      }

      expect(event.total_inventory).to eq(expected)
    end
  end

  describe 'start_date' do
    it 'returns the start date' do
      start_date_stub = double("date stub")

      allow(start_date_stub).to receive(:date).and_return("01/07/1985")
      event = Event.new("South Pearl Street Farmers Market",start_date_stub)
      expect(event.start_date.date).to eq("01/07/1985")
    end
  end

  describe '#sell_quantity' do
    it 'returns false if the event stock is too low' do
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)
      food_truck1.stock(item1, 35)
      food_truck1.stock(item2, 7)
      food_truck2.stock(item1, 50)
      food_truck2.stock(item2, 25)
      food_truck3.stock(item1, 65)
      food_truck3.stock(item2, 22)

      expect(event.sell_quantity(item1, 151)).to be false
      expect(event.sell_quantity(item2, 55)).to be false
    end

    it 'returns true if the event stock is sufficient' do
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)
      food_truck1.stock(item1, 35)
      food_truck1.stock(item2, 7)
      food_truck2.stock(item1, 50)
      food_truck2.stock(item2, 25)
      food_truck3.stock(item1, 65)
      food_truck3.stock(item2, 22)

      expect(event.sell_quantity(item1, 150)).to be true
      expect(event.sell_quantity(item2, 54)).to be true
    end

    it 'reduces the item stock in the food trucks' do
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)
      food_truck1.stock(item1, 35)
      food_truck1.stock(item2, 7)
      food_truck2.stock(item1, 50)
      food_truck2.stock(item2, 25)
      food_truck3.stock(item1, 65)
      food_truck3.stock(item2, 22)

      event.sell_quantity(item1,86)


      expect(food_truck1.check_stock(item1)).to eq(0)
      expect(food_truck2.check_stock(item1)).to eq(0)
      expect(food_truck3.check_stock(item1)).to eq(64)

      event.sell_quantity(item2,8)

      expect(food_truck1.check_stock(item2)).to eq(0)
      expect(food_truck2.check_stock(item2)).to eq(24)
      expect(food_truck3.check_stock(item2)).to eq(22)
    end
  end
end