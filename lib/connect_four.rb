require './lib/board'

class ConnectFour
  attr_reader :board
  def initialize
    @board = Board.new
  end
end

ConnectFour.new.board.show
