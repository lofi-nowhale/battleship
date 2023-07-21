require 'rspec'
require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
    describe '#initialize' do
        it "can initialize" do
            cell = Cell.new("B4")
            expect(cell).to be_a Cell
        end
    end
end
