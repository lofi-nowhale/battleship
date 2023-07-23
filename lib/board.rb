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
  
  # if time - refactor valid placement && and || stuff
  def valid_placement?(ship, placement_coordinates)
    if ship.length != placement_coordinates.length
      false
    elsif coordinate_horizontal_letters_logic(placement_coordinates) && coordinate_horizontal_numbers_logic(ship, placement_coordinates) || coordinate_vertical_number_logic(placement_coordinates) && coordinate_verticle_letter_logic(ship, placement_coordinates)
      true
    else false
    end
   
  end

# if time - refactor to put this in a module? 
  def coordinate_horizontal_letters_logic(placement_coordinates)
    letters = placement_coordinates.map do |coordinate|
    coordinate[0]
    end
    letters.uniq.length == 1
  end

  def coordinate_horizontal_numbers_logic(ship, placement_coordinates)
    numbers = placement_coordinates.map do |coordinate|
      coordinate[1].to_i
    end
    numbers == (numbers.min..numbers.max).to_a && numbers.length == ship.length
  end

  def coordinate_vertical_number_logic(placement_coordinates)
    numbers = placement_coordinates.map do |coordinate|
    coordinate[1].to_i
    end
    numbers.uniq.length == 1
  end

  def coordinate_verticle_letter_logic(ship, placement_coordinates)
    letters = placement_coordinates.map do |coordinate|
      coordinate[0].ord
    end
    letters == (letters.min..letters.max).to_a && letters.length == ship.length
  end


  def place(ship, placement_coordinates)
    placement_coordinates.each do |new_coordinate|
     @cells[new_coordinate].place_ship(ship)
    end
  end
end

