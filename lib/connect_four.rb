require './lib/board'

class ConnectFour
  def initialize
    @board = Board.new
    @headers = ("A".."Z").to_a.take(7).join
    @column_y_height = {}
    @pieces = {
      user: "X",
      computer: "O"
    }
  end

  def start
    @headers.chars.each do |letter|
      @column_y_height[letter] = 5
    end

    puts "Welcome to Connect Four!"
    puts "You will be playing as 'X'. The computer will be 'O'."
    puts "When prompted, select which column you would like to place your piece."
    puts ""
  end

  def main_loop
    start
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

  def computer_turn
    computer_move = @headers.chars.sample

    place_piece(computer_move, :computer)
  end

  def place_piece(move, player)
    column = @headers.index(move)
    row = @column_y_height[move]
    @column_y_height[move] -= 1

    @board.board[row][column] = @pieces[player]
  end

  def show_board
    puts @headers
    @board.show
  end

  def winner?(y, x, player)
  end
end

game = ConnectFour.new

game.main_loop
