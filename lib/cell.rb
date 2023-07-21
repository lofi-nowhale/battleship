class Cell
  attr_reader :coordinate, :ship, :fired_upon
  def initialize(coordinate)
    @coordinate = coordinate
    @ship
    @fired_upon = false
  end

  def empty? 
    @ship.nil?
  end

  def place_ship(new_ship)
    @ship = new_ship
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon 
    @fired_upon = true
    if @ship
      ship.hit
    end
  end

  def render(user = false)
    if fired_upon? && @ship == nil
      return "M"
    elsif 
      user == true && @ship
      "S"
    elsif
      fired_upon? && @ship && ship.sunk?
      "X"
    elsif
      fired_upon? && @ship
      "H"
    else 
      return "."
    end
  end

end