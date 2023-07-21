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
      require 'pry';binding.pry
      expect(board.cells).not_to eq({})
      expect(board.cells).to have(16).things
    end
  end
end