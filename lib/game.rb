
class EmptyToken
  def to_s
    " "
  end
end

class Game
  attr_reader   :turn, :empty
  attr_accessor :board

  def initialize
    @board = Array.new(3) { Array.new(3, empty) }
    @turn  = :x
  end

  def insert_token(x, y)
    @board[x][y] = @turn
    change_turn
  end

  def find_winner
    check_rows || check_columns || check_diagonals
  end

  def check_rows
    @board.each { |row| return row.first if all_equal?(row) }

    false
  end

  def check_columns
    @board
      .transpose
      .each { |row| return row.first if all_equal?(row) }

    false
  end

  def check_diagonals
    diagonals = [
      [@board[0][0], @board[1][1], @board[2][2]],
      [@board[0][2], @board[1][1], @board[2][0]]
    ]

    diagonals.each { |row| return row.first if all_equal?(row) }

    false
  end

  def to_s
    @board.map { |row| display_row(row) }.join("\n")
  end

  def empty
    @empty ||= EmptyToken.new
  end

  private

  def all_equal?(row)
    row.each_cons(2).all? { |x,y| x == y }
  end

  def change_turn
    @turn = find_next_player
  end

  def find_next_player
    @turn == :x ? :o : :x
  end

  def display_row(row)
    "| #{row[0]} | #{row[1]} | #{row[2]} |".upcase
  end
end
