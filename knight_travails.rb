# create 8x8 nested array
# place a knight on a specified place in the board
# map out all possible moves the knight could make from that position 

class Knight
  attr_accessor :row, :column, :parent, :children
  def initialize(row = rand(0...7), column = rand(0...7), parent = nil, children = nil)
    @row = row
    @column = column
    @parent = parent
    @children = []
  end
end


class Board
  attr_accessor :grid
  attr_reader :knight
  def initialize
    @grid = Array.new(8) {Array.new(8)}
    move_tree(3, 3, @grid)
  end

  def move_tree(row, column, grid = @grid)
    
    root = Knight.new(row, column)
    
      root.children << Knight.new(row + 2, column + 1, root) unless row > 5 || column > 6
      root.children << Knight.new(row + 2, column - 1, root) unless row > 5 || column < 1
      root.children << Knight.new(row + 1, column + 2, root) unless row > 6 || column > 5
      root.children << Knight.new(row + 1, column - 2, root) unless row > 6 || column < 2
      root.children << Knight.new(row - 2, column + 1, root) unless row < 2 || column > 6
      root.children << Knight.new(row - 2, column - 1, root) unless row < 2 || column < 1
      root.children << Knight.new(row - 1, column + 2, root) unless row < 1 || column > 5
      root.children << Knight.new(row - 1, column - 2, root) unless row < 1 || column < 2

    p root

  end
end


chess_board = Board.new
