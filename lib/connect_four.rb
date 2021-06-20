require './lib/board'

class ConnectFour
  attr_reader :board

  def initialize
    @board = Board.new
  end

  def start
    puts "Welcome to Connect Four!"
    puts "You will be playing as 'X'. The computer will be 'O'."
    puts "When prompted, select which column you would like to place your piece."
    puts ""
    @board.show
  end
end
