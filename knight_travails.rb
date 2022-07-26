#  Put together a script that creates a game board and a knight.
# Treat all possible moves the knight could make as children in a tree. Don’t allow any moves to go off the board.
# Decide which search algorithm is best to use for this case. Hint: one of them could be a potentially infinite series.
# Use the chosen search algorithm to find the shortest path between the starting square (or node) and the ending square. Output what that full path looks like, e.g.:

class Knight
  attr_accessor :row, :column, :up_right, :up_left, :right_up, :left_up, :down_right, :down_left, :right_down, :left_down
  def initialize(row = rand(0...7), column = rand(0...7))
    @row = row
    @column = column
    @up_right
    @up_left
    @right_up
    @left_up
    @down_right
    @down_left
    @right_down
    @left_down
  end
end


# create a tree of every possible move the knight can make from a given position on the board
class Board
  attr_accessor :grid, :root, :knight
  def initialize
   @grid =  Array.new(8) {Array.new(8)}
   @knight = Knight.new(3, 3)
   @root = move_knight(@knight.row, @knight.column, @grid)
   p @root
  end

  def move_knight (row, column, grid)
    return if row > 7 || row < 0 || column > 7 || column < 0
    root = Knight.new(row, column)
    grid[row][column] = root
    
    begin
      root.up_right = move_knight(row + 2, column + 1, grid) unless row > 5 || column > 6 || grid[row + 2][column + 1] != nil
      root.up_left = move_knight(row + 2, column - 1, grid) unless row > 5 || column < 1 || grid[row + 2][column - 1] != nil
      root.right_up = move_knight(row + 1, column + 2, grid) unless row > 6 || column > 5 || grid[row + 1][column + 2] != nil
      root.left_up = move_knight(row + 1, column - 2, grid) unless row > 6 || column < 2 || grid[row + 1][column - 2] != nil
      root.down_right = move_knight(row - 2, column + 1, grid) unless row < 2 || column > 6 || grid[row - 2][column + 1] != nil
      root.down_left = move_knight(row - 2, column - 1, grid) unless row < 2 || column < 1 || grid[row - 2][column - 1] != nil
      root.right_down = move_knight(row - 1, column + 2, grid) unless row < 1 || column > 5 || grid[row - 1][column + 2] != nil
      root.left_down = move_knight(row - 1, column - 2, grid) unless row < 1 || column < 2 || grid[row - 1][column - 2] != nil
    rescue
      grid.each_with_index do |row, row_index|
        row.each_with_index do |space, column_index|
          if grid[row_index][column_index] != nil
            move_knight(row_index, column_index, grid)
          end
        end
      end
    end
    root
  end

  

end


chess_board = Board.new


