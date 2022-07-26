#  Put together a script that creates a game board and a knight.
# Treat all possible moves the knight could make as children in a tree. Don’t allow any moves to go off the board.
# Decide which search algorithm is best to use for this case. Hint: one of them could be a potentially infinite series.
# Use the chosen search algorithm to find the shortest path between the starting square (or node) and the ending square. Output what that full path looks like, e.g.:

class Knight
  attr_accessor :row, :column
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
  attr_accessor :grid
  def initialize
   @grid =  Array.new(8) {Array.new(8)}
   @knight = Knight.new(3, 3)
   move_knight(@knight.row, @knight.column, @grid)
   
  end

  def move_knight (row, column, grid)
    return if row > 7 || row < 0 || column > 7 || column < 0
    knight = Knight.new(row, column)
    grid[row][column] = knight
    
    begin
    knight.up_right = move_knight(row + 2, column + 1, grid) unless row > 5 || column > 6 || grid[row + 2][column + 1] != nil
    knight.up_left = move_knight(row + 2, column - 1, grid) unless row > 5 || column < 1 || grid[row + 2][column - 1] != nil
    knight.right_up = move_knight(row + 1, column + 2, grid) unless row > 6 || column > 5 || grid[row + 1][column + 2] != nil
    knight.left_up = move_knight(row + 1, column - 2, grid) unless row > 6 || column < 2 || grid[row + 1][column - 2] != nil
    knight.down_right = move_knight(row - 2, column + 1, grid) unless row < 2 || column > 6 || grid[row - 2][column + 1] != nil
    knight.down_left = move_knight(row - 2, column - 1, grid) unless row < 2 || column < 1 || grid[row - 2][column - 1] != nil
    knight.right_down = move_knight(row - 1, column + 2, grid) unless row < 1 || column > 5 || grid[row - 1][column + 2] != nil
    knight.left_down = move_knight(row - 1, column - 2, grid) unless row < 1 || column < 2 || grid[row - 1][column - 2] != nil
    rescue
      grid.each_with_index do |row, row_index|
        row.each_with_index do |space, column_index|
          if grid[row_index][column_index] != nil
            move_knight(row_index, column_index, grid)
          end
        end
      end
    end
    p grid
  end
end




chess_board = Board.new
