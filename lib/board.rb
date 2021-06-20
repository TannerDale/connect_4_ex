class Board
  attr_reader :row_count, :column_count
  attr_accessor :board

  def initialize
    @row_count = 6
    @column_count = 7
    @board = []
    @headers = ("A".."Z").to_a.take(@column_count).join
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
    puts @headers
    @board.map do |row|
      puts row.join
    end
  end
end
