class Board
  def initialize
   @grid =  Array.new(8) {Array.new(8)}
   @knight = "K"
   place_knight
  end

  def place_knight(row = rand(0...7), column = rand(0...7))
    @grid[row][column] = @knight
    p @grid
  end

  def move_knight
    @grid.each_with_index do |row, row_index|
      row.each_with_index do |square, column_index| if square == "K"
        current_location = [row_index],[column_index]
        p current_location
      end
      end
    end
  end
end



chess_board = Board.new
chess_board.move_knight