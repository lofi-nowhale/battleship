class Board
  attr_reader :cells
  def initialize
    @cells = Hash.new(0)
    build_board 
  end

  def build_board
    ('A'..'D').each do |letter|
      (1..4).each do |number|
        coordinate = "#{letter}#{number}"
        cell_default = '*'
        @cells[coordinate] = cell_default
      end
    end
  end



end
