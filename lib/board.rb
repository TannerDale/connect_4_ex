class Board
  attr_reader :row_count, :column_count
  attr_accessor :board

  def initialize
    @row_count = 6
    @column_count = 7
    @board = create
  end

  def create
    the_board = []
    @column_count.times do
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
