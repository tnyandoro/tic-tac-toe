# Game Logic
class Game
  attr_accessor :board

  def initialize(board)
    @board = board
    @positions = positions
  end

  def positions
    positions = {}
    @board.each_with_index do |arr, x|
      arr.each_with_index do |value, y|
        positions[value.to_s] = { 'x' => x, 'y' => y }
      end
    end
    positions
  end

  def getpositions
    @positions
  end

  def reset_board
    @board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  end

  def apply_move(move_number, player)
    x = positions[move_number.to_s]['x']
    y = positions[move_number.to_s]['y']
    @board[x][y] = player['mark']
  end

  def win(player)
    b = @board
    m = player['mark']
    row = @board
    columns = @board.transpose
    diagonal = [[b[0][0], b[1][1], b[2][2]], [b[0][2], b[1][1], b[2][0]]]

    winning_sequence = row + columns + diagonal
    win = []
    winning_sequence.each do |item|
      win.push(item.all?(m))
    end
    win.any?
  end
end
