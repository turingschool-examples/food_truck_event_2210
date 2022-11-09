# frozen_string_literal: true

require 'rspec'
require './lib/food_truck'

describe FoodTruck do
  describe '#initialize' do
    it 'exists and has attributes' do
      food_truck = FoodTruck.new("Rocky Mountain Pies")
      expect(food_truck).to be_instance_of(FoodTruck)
    end
  end
end
