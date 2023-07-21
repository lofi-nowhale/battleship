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
end