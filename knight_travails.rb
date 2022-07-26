class Board
  def initialize
   @grid =  Array.new(8) {Array.new(8)}
   @knight = "K"
  end

  def place_knight(column = rand(0...7), row = rand(0...7))
    @grid[column][row] = @knight
    p @grid
  end
end



chess_board = Board.new
chess_board.place_knight