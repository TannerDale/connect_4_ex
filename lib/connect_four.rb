require './lib/board'

class ConnectFour
  attr_reader :board

  def initialize
    @board = Board.new
    @headers = ("A".."Z").to_a.take(@board.column_count).join
  end

  def start
    puts "Welcome to Connect Four!"
    puts "You will be playing as 'X'. The computer will be 'O'."
    puts "When prompted, select which column you would like to place your piece."
    puts ""
  end

  def user_turn
    puts "Which column do you want to place your piece in?"
    print "-> "
    user_move = gets.chomp
  end

  def show_board
    puts @headers
    @board.show
  end
end

ConnectFour.new.show_board
