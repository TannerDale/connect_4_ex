require './lib/board'

class ConnectFour
  def initialize
    @board = Board.new
    @headers = ("A".."Z").to_a.take(7).join
    @column_y_height = {}
    @pieces = {
      user: "X",
      computer: "O",
      player_1: "X",
      player_2: "O"
    }
  end

  def play
    start
    multi_player_loop
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

  def multi_player_loop
    show_board

    loop do
      user_1_win = user_turn(:player_1)

      if user_1_win
        show_board
        puts "Player 1 wins!"
        break
      end

      show_board

      player_2_win = user_turn(:player_2)

      if player_2_win
        show_board
        puts "Player 2 wins!"
        break
      end

      show_board
    end
  end

  def single_player_loop
    show_board

    loop do
      player_win = user_turn(:player)

      if player_win
        show_board
        puts "You win!"
        break
      end

      show_board

      computer_win = computer_turn

      if computer_win
        show_board
        puts "You lost!"
        break
      end

      show_board
    end
  end

  def user_turn(player)
    puts "Which column do you want to place your piece in?"
    print "-> "

    user_move = gets.chomp
    while !@headers.include?(user_move.upcase) || @column_y_height[user_move.upcase] < 0
      puts "Invalid position, please choose another move."
      print "-> "
      user_move = gets.chomp
    end

    place_piece(user_move.upcase, player)
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

    winner?(column, row, player)
  end

  def show_board
    puts @headers
    @board.show
  end

  def winner?(column, row, player)
    board = @board.board

    # horizontal
    if board[row].each_cons(4).any? { |group| group.all? { |piece| piece == @pieces[player] } }
      return true
    end

    if row <= 2
      # vertical
      in_a_row = board.count do |rows|
        rows[column] == @pieces[player] && board[row + 1][column] == @pieces[player]
      end

      return true if in_a_row == 4
    end

    # diagonal bot left to top right
    y = row
    x = column
    consecutive = 0
    while board[y] && board[y][x] == @pieces[player]
      consecutive += 1
      y += 1
      x -= 1
    end

    y = row - 1
    x = column + 1

    while board[y] && board[y][x] == @pieces[player]
      consecutive += 1
      y -= 1
      x += 1
    end

    return true if consecutive >= 4

    # diagonal bot right to top left
    y = row
    x = column
    consecutive = 0
    while board[y] && board[y][x] == @pieces[player]
      consecutive += 1
      y += 1
      x += 1
    end

    y = row - 1
    x = column - 1

    while board[y] && board[y][x] == @pieces[player]
      consecutive += 1
      y -= 1
      x -= 1
    end

    return true if consecutive >= 4


    false
  end
end

ConnectFour.new.play
