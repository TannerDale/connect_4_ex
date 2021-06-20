class Board
  attr_reader :row_count, :column_count
  attr_accessor :board

  def initialize
    @row_count = 6
    @column_count = 7
    @board = []
    create
  end

  def create
    default_row = []
    @column_count.times do
      default_row << "."
    end

    @row_count.times do
      @board << default_row
    end
  end

  def show
    @board.map do |row|
      puts row.join
    end
  end
end
