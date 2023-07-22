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
        cell_default = Cell.new(coordinate)
        @cells[coordinate] = cell_default
      end
    end
  end

  def valid_coordinate?(coordinate)
    @cells.include?(coordinate)
  end
  
  def valid_placement?(ship, placement_coordinates)
    if ship.length != placement_coordinates.length
      false
    else true
    end
   
  end


end
