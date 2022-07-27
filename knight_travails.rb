class Knight
  attr_accessor :row, :column, :parent, :up_right, :up_left, :right_up, :left_up, :down_right, :down_left, :right_down,
                :left_down

  def initialize(row = rand(0...7), column = rand(0...7), parent = nil)
    @row = row
    @column = column
    @parent = parent
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

class Board
  attr_accessor :grid, :knight

  def initialize
    @grid = Array.new(8) { Array.new(8) }
    move_tree(3, 3, 6, 6)
  end

  def move_tree(row, column, goal_row, goal_column, queue = [])
    count = 0
    root = Knight.new(row, column)
    queue.push(root)
    loop do
      root = queue.shift
      if root.row == goal_row && root.column == goal_column
        until root == nil do
        p "#{[root.row, root.column]}"
        root = root.parent
        end
        break
      else
        unless root.row > 5 || root.column > 6
          root.up_right = Knight.new(root.row + 2, root.column + 1, root)
          queue.push(root.up_right)
        end
        unless root.row > 5 || root.column < 1
          root.up_left = Knight.new(root.row + 2, root.column - 1, root)
          queue.push(root.up_left)
        end
        unless root.row > 6 || root.column > 5
          root.right_up = Knight.new(root.row + 1, root.column + 2, root)
          queue.push(root.right_up)
        end
        unless root.row > 6 || root.column < 2
          root.left_up = Knight.new(root.row + 1, root.column - 2, root)
          queue.push(root.left_up)
        end
        unless root.row < 2 || root.column > 6
          root.down_right = Knight.new(root.row - 2, root.column + 1, root)
          queue.push(root.down_right)
        end
        unless root.row < 2 || root.column < 1
          root.down_left = Knight.new(root.row - 2, root.column - 1, root)
          queue.push(root.down_left)
        end
        unless root.row < 1 || root.column > 5
          root.right_down = Knight.new(root.row - 1, root.column + 2, root)
          queue.push(root.right_down)
        end
        unless root.row < 1 || root.column < 2
          root.left_down = Knight.new(root.row - 1, root.column - 2, root)
          queue.push(root.left_down)
        end
      end
      count += 1
    end
  end
end

chess_board = Board.new
