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
    it "can contain many cells from the start" do
      board = Board.new
      expect(board.cells).not_to eq({})
      # require 'pry';binding.pry
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
end