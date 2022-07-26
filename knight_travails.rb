#  Put together a script that creates a game board and a knight.
# Treat all possible moves the knight could make as children in a tree. Don’t allow any moves to go off the board.
# Decide which search algorithm is best to use for this case. Hint: one of them could be a potentially infinite series.
# Use the chosen search algorithm to find the shortest path between the starting square (or node) and the ending square. Output what that full path looks like, e.g.:


class Knight
  def initialize(row = rand(0...7), column = rand(0...7))
    @row = row
    @column = column
    @move_tree = build_tree(row, column)
  end

  def build_tree(row, column)
    return if @row > 7 || @row < 0 || @column > 7 || @column < 0
      

  end
end

class Board
  def initialize
   @grid =  Array.new(8) {Array.new(8)}
  end
end



chess_board = Board.new
chess_board.move_knight