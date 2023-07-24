
require 'rspec'
require_relative 'ship'
require_relative 'cell'
require_relative 'board'


class Game
  def initialize
    start_game
  end
  
  def start_game
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
    choice = gets 
    if choice == p 
      board.render
    elsif choice == q
      exit
    else puts "You're not very good at following directions."
    end
  end
end