require './lib/item'

RSpec.describe Item do 
  describe "#initialize" do 
    it 'will exist and have attributes' do 
      item1 = Item.new({name: 'Peach pie (slice)', price: "$3.75"})

      expect(item1).to be_a(Item)
      expect(item1.name).to eq('Peach pie (slice)')
      expect(item1.price).to eq("$3.75")
    end 
  end 
end 