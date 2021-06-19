class Board
  attr_accessor :board

  def initialize
    @rows = 6
    @columns = 7
    @board = []
    @headers = ("A".."Z").to_a.take(@columns).join
    create
  end

  def create
    default_row = []
    @columns.times do
      default_row << "."
    end

    @rows.times do
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

Board.new.show
