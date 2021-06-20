class Board
  attr_accessor :board

  def initialize
    @board = create
  end

  def create
    the_board = []
    6.times do
      the_board << %w(. . . . . . .)
    end
    the_board
  end

  def show
    @board.each do |row|
      puts row.join
    end
  end
end
