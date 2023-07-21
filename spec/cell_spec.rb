require 'rspec'
require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
  describe '#initialize' do
    it "can initialize" do
      cell = Cell.new("B4")
      expect(cell).to be_a Cell
    end

    it 'has readable attributes' do
      cell = Cell.new("B4")

      expect(cell.coordinate).to eq("B4")
      expect(cell.ship).to eq(nil)
    end
  end

  describe '#empty?' do 
    it 'can show if the cell is empty' do
      cell = Cell.new("B4")

      cell.empty?

      expect(cell.empty?).to eq(true)
    end
  end

  describe '#place_ship' do 
    it 'can place a ship in a cell' do
      cell = Cell.new("B4")
      cruiser = Ship.new("Cruiser", 3)

      cell.place_ship(cruiser)

      expect(cell.ship).to eq(cruiser)
      expect(cell.empty?).to eq(false)
    end
  end
end
