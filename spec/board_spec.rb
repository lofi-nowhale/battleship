require 'rspec'
require './lib/ship'
require './lib/cell'
require './lib/board'

RSpec.describe Board do
  describe '#initialize' do
    it "can initialize" do
      board = Board.new
      expect(board).to be_a Board
    end
  end

  describe '#cells' do
    it "contains the necessary cells for the board" do
      board = Board.new
      expect(board.cells).not_to eq({})
      expect(board.cells.length).to eq(16)
    end
  end

  describe '#valid_coordinate?' do 
    it 'can tell us if a corrdinate is on the board or not' do
      board = Board.new
      
      expect(board.valid_coordinate?("A1")).to eq(true)
      expect(board.valid_coordinate?("D4")).to eq(true)
      expect(board.valid_coordinate?("A5")).to eq(false)
      expect(board.valid_coordinate?("E1")).to eq(false)
      expect(board.valid_coordinate?("A22")).to eq(false)
    end
  end

  describe '#valid_placement?' do
    it "it can tell us if the ship's placement is valid where the coordinates in the array are the same length as the ship" do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)

      expect(board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
      expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)
      expect(board.valid_placement?(cruiser, ["A2", "A3", "A4"])).to eq(true)
      
    end

    it "can tell us if the ship's placement is valid where the coordinates are consecutive" do 
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)
      
      # expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq(false)
      expect(board.valid_placement?(submarine, ["A1", "C1"])).to eq(false)
      expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to eq(false)
      expect(board.valid_placement?(submarine, ["C1", "B1"])).to eq(false)
    end
    
    xit "can tell us if the ship's placement is valid - it will not allow placement to be diagonal" do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)
      
      expect(board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to eq(false)
      expect(board.valid_placement?(submarine, ["C2", "D3"])).to eq(false)
    end
    
    xit "can tell us if the ship's placement is valid - a ship is valid if all previous checks pass => the array of coordinates is the same length of the ship, the coordinates are consecutive, and the coordinates are not diagonal" do 
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)
      
      expect(board.valid_placement?(submarine, ["A1", "A2"])).to eq(true)
      expect(board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to eq(true)
    end
  end
end