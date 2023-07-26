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
    elsif occupied_cells(placement_coordinates)
      false
    elsif coordinate_horizontal_letters_logic(placement_coordinates) && coordinate_horizontal_numbers_logic(ship, placement_coordinates) || coordinate_vertical_number_logic(placement_coordinates) && coordinate_verticle_letter_logic(ship, placement_coordinates)
      true
    else false
    end
  end

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

  #Come back to this later 
  def occupied_cells(placement_coordinates)
    placement_coordinates.each do |new_coordinate|
      return @cells[new_coordinate].ship
    end
  end
  
  def render(user = false)
    if user == true
      puts "  1 2 3 4 /n"
      puts "A #{@cells["A1"].render(true)} #{@cells["A2"].render(true)} #{@cells["A3"].render(true)} #{@cells["A4"].render(true)} /n"
      puts "B #{@cells["B1"].render(true)} #{@cells["B2"].render(true)} #{@cells["B3"].render(true)} #{@cells["B4"].render(true)} /n"
      puts "C #{@cells["C1"].render(true)} #{@cells["C2"].render(true)} #{@cells["C3"].render(true)} #{@cells["C4"].render(true)} /n"
      puts "D #{@cells["D1"].render(true)} #{@cells["D2"].render(true)} #{@cells["D3"].render(true)} #{@cells["D4"].render(true)} /n"
    else
      puts "  1 2 3 4 /n"
      puts "A #{@cells["A1"].render} #{@cells["A2"].render} #{@cells["A3"].render} #{@cells["A4"].render} /n"
      puts "B #{@cells["B1"].render} #{@cells["B2"].render} #{@cells["B3"].render} #{@cells["B4"].render} /n"
      puts "C #{@cells["C1"].render} #{@cells["C2"].render} #{@cells["C3"].render} #{@cells["C4"].render} /n"
      puts "D #{@cells["D1"].render} #{@cells["D2"].render} #{@cells["D3"].render} #{@cells["D4"].render} /n"

    end 
  end
end



