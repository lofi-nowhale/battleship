
require 'rspec'
require_relative 'ship'
require_relative 'cell'
require_relative 'board'


class Game
  attr_reader :board
  def initialize
    @board = Board.new
    @player_board = Board.new
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
      puts "I have laid out my ships on the grid."
      puts "You now need to lay out your two ships."
      puts "The Cruiser is three units long and the Submarine is two units long."
      player_cruiser_placement
      @player_board.render(true)
      player_sub_placement
      @player_board.render(true)
      turn_phase
      
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

  def player_cruiser_placement
    @player_board.render
    loop do
      puts "Let's place your cruiser. Gimme 3 coordinates!"
      #if time - lets refactor this uggo/ new directions to specify for the user the format
    
      player_coordinates = gets.chomp

      p @player_cruiser_coords = player_coordinates.to_s.split
      @player_cruiser = Ship.new("Cruiser", 3)
      
      if !@player_board.valid_placement?(@player_cruiser, @player_cruiser_coords)
        puts "try again...smh"
      end

      break if @player_board.valid_placement?(@player_cruiser, @player_cruiser_coords)
    end
    @player_board.place(@player_cruiser, @player_cruiser_coords)
  end

  def player_sub_placement
    @player_board.render
    loop do
      puts "Let's place your submarine. Gimme 2 coordinates!"
      #if time - lets refactor this uggo/ new directions to specify for the user the format
    
      player_coordinates = gets.chomp

      p @player_sub_coords = player_coordinates.to_s.split
      @player_sub = Ship.new("Submarine", 2)
      
      if !@player_board.valid_placement?(@player_sub, @player_sub_coords)
        puts "try again...smh"
      end

      break if @player_board.valid_placement?(@player_sub, @player_sub_coords)
    end
    @player_board.place(@player_sub, @player_sub_coords)
  end

  def turn_phase
    puts "=============COMPUTER BOARD============="
    @board.render
    puts "==============PLAYER BOARD=============="
    @player_board.render(true)

    loop do
      puts "Enter the coordinate for your shot"
      player_shot = gets.chomp
      formatted_player_shot = player_shot.to_s

      if !@board.valid_coordinate?(formatted_player_shot) || @board.cells[formatted_player_shot].fired_upon? 
        puts "Please enter a valid coordinate"
      end

      break if @board.valid_coordinate?(formatted_player_shot) && !@board.cells[formatted_player_shot].fired_upon?
    end #Not receiving any errors, but we will need to test the "re-shoot on a cell logic"
  
  end

end
