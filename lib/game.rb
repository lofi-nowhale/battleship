
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
      puts "Let's Fucking Go!"
      # create_new_board
      comp_place_ship
    elsif choice == "q"
      exit
    else 
      puts "You're not very good at following directions."
    end
  end 

  # def create_new_board
  #   board = Board.new
  #   # board.render
  # end

  def comp_place_ship
    cruiser = Ship.new("Cruiser", 3)
    @board.place(cruiser, ["A1", "A2", "A3"])

  end

end
