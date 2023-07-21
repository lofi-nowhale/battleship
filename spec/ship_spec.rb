require 'rspec'
require './lib/ship'

RSpec.describe Ship do
  describe '#initialize' do
    it "can initialize" do
      cruiser = Ship.new("Cruiser", 3)
      expect(cruiser).to be_a Ship
    end

    it "can have readable attributes" do
      cruiser = Ship.new("Cruiser", 3)
      expect(cruiser.name).to eq("Cruiser")
      expect(cruiser.length).to eq(3)
    end
  end

  describe '#health' do
    it "can read the initial health" do
      cruiser = Ship.new("Cruiser", 3)
      expect(cruiser.health).to eq(3)
    end

    it "can read the health after being hit" do
      cruiser = Ship.new("Cruiser", 3)
      expect(cruiser.health).to eq(3)
      cruiser.hit
      expect(cruiser.health).to eq(2)
      cruiser.hit
      expect(cruiser.health).to eq(1)
      cruiser.hit
      expect(cruiser.health).to eq(0)
    end
    
  end

  describe '#sunk?' do
    it "can tell if the ship is sunk" do
      cruiser = Ship.new("Cruiser", 3)
      expect(cruiser.sunk?).to eq(false)
      cruiser.hit
      expect(cruiser.sunk?).to eq(false)
      cruiser.hit
      expect(cruiser.sunk?).to eq(false)
      cruiser.hit
      expect(cruiser.sunk?).to eq(true)
     end
    
  end

end
