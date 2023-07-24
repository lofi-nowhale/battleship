require 'rspec'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'

RSpec.describe Game do
  describe '#initialize' do
    it "can initialize" do
      game = Game.new
      expect(game).to be_a Game
    end
  end
end