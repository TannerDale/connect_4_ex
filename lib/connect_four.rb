require './lib/board'

class ConnectFour
  attr_reader :board

  def initialize
    @board = Board.new
    @headers = ("A".."Z").to_a.take(@board.column_count).join
    @column_y_height = {}
    @pieces = {
      user: "X",
      computer: "O"
    }
  end

  def start
    @headers.chars.each do |letter|
      @column_y_height[letter] = 0
    end

    puts "Welcome to Connect Four!"
    puts "You will be playing as 'X'. The computer will be 'O'."
    puts "When prompted, select which column you would like to place your piece."
    puts ""
  end

  def user_turn
    puts "Which column do you want to place your piece in?"
    print "-> "

    user_move = gets.chomp
    while !@headers.include?(user_move.upcase)
      puts "Invalid Column, please choose from #{@headers}."
      print "-> "
      user_move = gets.chomp
    end

    place_piece(user_move.upcase, :user)
  end

  def place_piece(move, player)
    column = @headers.index(move)
    row = @board.row_count - @column_y_height[move]
    @column_y_height[move] += 1

    @board.board[row][column] = @pieces[player]
  end

  def show_board
    puts @headers
    @board.show
  end
end

game = ConnectFour.new
