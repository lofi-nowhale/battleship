
require 'rspec'
require_relative 'ship'
require_relative 'cell'
require_relative 'board'


class Game
  attr_reader :board
  def initialize
    @board = Board.new
    start_game
  end
  
  def start_game
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
    choice = gets.chomp
    if choice == "p" 
      puts "Lets go!!"
      comp_place_cruiser
      comp_place_sub
      @board.render(true)
      p "I've placed my ships, place yours now"
      exit
    elsif choice == "q"
      exit
    else 
      puts "You're not very good at following directions."
    end
  end 

  def comp_place_cruiser
    cruiser = Ship.new("Cruiser", 3)

    loop do
      c_coord_1 = @board.cells.keys.sample
      c_coord_2 = @board.cells.keys.sample
      c_coord_3 = @board.cells.keys.sample
  
        if @board.valid_placement?(cruiser, [c_coord_1, c_coord_2, c_coord_3])
          @board.place(cruiser, [c_coord_1, c_coord_2, c_coord_3])
        break

      end
    end
  end

  def comp_place_sub
    submarine = Ship.new("Submarine", 2)

    loop do 
      sub_coord_1 = @board.cells.keys.sample
      sub_coord_2 = @board.cells.keys.sample

      if @board.valid_placement?(submarine, [sub_coord_1, sub_coord_2])
        @board.place(submarine, [sub_coord_1, sub_coord_2])
      break
      end
    end
  end

end
