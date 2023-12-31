
require 'rspec'
require_relative 'ship'
require_relative 'cell'
require_relative 'board'


class Game
  attr_reader :board
  def initialize
    @board = Board.new
    @player_board = Board.new
    @computer_shots = []
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
      puts "I have laid out my ships on the grid."
      puts "You now need to lay out your two ships."
      puts "The Cruiser is three units long and the Submarine is two units long."
      player_cruiser_placement
      player_sub_placement
      loop do
        round_start
        player_shot
        computer_shot
        results
        win_condition
        break if @cruiser.sunk? && @submarine.sunk? || @player_cruiser.sunk? && @player_sub.sunk?
      end
      @board = Board.new
      @player_board = Board.new

    elsif choice == "q"
      exit
    else 
      puts "You're not very good at following directions."
    end
  end 

  def comp_place_cruiser
    @cruiser = Ship.new("Cruiser", 3)

    loop do
      c_coord_1 = @board.cells.keys.sample
      c_coord_2 = @board.cells.keys.sample
      c_coord_3 = @board.cells.keys.sample

        if @board.valid_placement?(@cruiser, [c_coord_1, c_coord_2, c_coord_3])
          @board.place(@cruiser, [c_coord_1, c_coord_2, c_coord_3])
        break

      end
    end
  end

  def comp_place_sub
    @submarine = Ship.new("Submarine", 2)

    loop do 
      sub_coord_1 = @board.cells.keys.sample
      sub_coord_2 = @board.cells.keys.sample

      if !@board.cells[sub_coord_1].ship && !@board.cells[sub_coord_2].ship && @board.valid_placement?(@submarine, [sub_coord_1, sub_coord_2])
        @board.place(@submarine, [sub_coord_1, sub_coord_2])
      break
      end
    end
  end

  def player_cruiser_placement
    loop do
      puts "Let's place your cruiser. You will need a capital letter and a number, with each coordinate separated by a space.  Now gimme 3 coordinates!"
      player_coordinates = gets.chomp

      @player_cruiser_coords = player_coordinates.to_s.split
      @player_cruiser = Ship.new("Cruiser", 3)
      
      if !@player_board.valid_placement?(@player_cruiser, @player_cruiser_coords)
        puts "try again...smh"
      end

      break if @player_board.valid_placement?(@player_cruiser, @player_cruiser_coords)
    end
    @player_board.place(@player_cruiser, @player_cruiser_coords)
  end

  def player_sub_placement
    loop do
      puts "Let's place your submarine. Gimme 2 coordinates!"
      
      player_coordinates = gets.chomp

      @player_sub_coords = player_coordinates.to_s.split
      @player_sub = Ship.new("Submarine", 2)
      
      if !@player_board.valid_placement?(@player_sub, @player_sub_coords)
        puts "try again...smh"
      end

      break if @player_board.valid_placement?(@player_sub, @player_sub_coords)
    end
    @player_board.place(@player_sub, @player_sub_coords)
  end

  def round_start
    puts "=============COMPUTER BOARD============="
    @board.render
    puts "==============PLAYER BOARD=============="
    @player_board.render(true)
  end

  def player_shot
    loop do
      puts "Enter the coordinate for your shot"
      player_shot = gets.chomp
      @formatted_player_shot = player_shot.to_s

      if !@board.valid_coordinate?(@formatted_player_shot) || @board.cells[@formatted_player_shot].fired_upon? 
        puts "Please enter a valid coordinate"
      end

      break if @board.valid_coordinate?(@formatted_player_shot) && !@board.cells[@formatted_player_shot].fired_upon?

    end 
    @board.cells[@formatted_player_shot].fire_upon
    @board.cells[@formatted_player_shot].render
  end

  def computer_shot
    loop do
      @c_shot = @board.cells.keys.sample

      break if !@player_board.cells[@c_shot].fired_upon? 
    end
    @player_board.cells[@c_shot].fire_upon
    @player_board.cells[@c_shot].render(true)
  end

  def player_hit_or_miss
    if @board.cells[@formatted_player_shot].ship
      @first_response = "hit"
    else 
      @first_response = 'miss'
    end
  end

  def player_sunk_ship?
    if @board.cells[@formatted_player_shot].ship == @cruiser && @cruiser.sunk?
      puts "You sunk my cruiser!"
    end
    if @board.cells[@formatted_player_shot].ship == @submarine && @submarine.sunk?
      puts "You sunk my submarine!"
    end
  end

  def computer_hit_or_miss
    if @player_board.cells[@c_shot].ship
      @second_response = "hit"
    else 
      @second_response = 'miss'
    end
  end

  def computer_sunk_ship?
    if @player_board.cells[@c_shot].ship == @player_cruiser && @player_cruiser.sunk?
      puts "I sunk your cruiser!"
    end
    if @player_board.cells[@c_shot].ship == @player_sub && @player_sub.sunk?
      puts "I sunk your submarine!"
    end
  end

  def results
    player_hit_or_miss
    computer_hit_or_miss
    puts "Your shot on #{@formatted_player_shot} was a #{@first_response}."
    player_sunk_ship?
    puts "My shot on #{@c_shot} was a #{@second_response}."
    computer_sunk_ship?
  end

  def win_condition
    if @player_cruiser.sunk? && @player_sub.sunk?
      puts "I won!"
    elsif @cruiser.sunk? && @submarine.sunk?
      puts "You won!"
    else 
      puts "Next round!"
    end
  end
end
