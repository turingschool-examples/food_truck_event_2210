# frozen_string_literal: true

require 'rspec'
require './lib/event'

describe Event do
  describe '#initialize' do
    it 'exists and has attributes' do
      event = Event.new("South Pearl Street Farmers Market")

      expect(event).to be_instance_of(Event)
      expect(event.title).to eq("South Pearl Street Farmers Market")
    end
  end
end
