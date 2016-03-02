require 'game'

describe Game do
  let(:game)  { Game.new }
  let(:empty) { game.empty }

  it 'has a board' do
    expect(game.board.size).to  eq(3)
  end

  it 'adds a piece to the board when making a move' do
    game.insert_token(0,2)

    expect(game.board).to eq([[empty,empty,:x],[empty,empty,empty],[empty,empty,empty]])
  end

  it 'switches turns after one move' do
    game.insert_token(0,1)
    game.insert_token(0,2)

    expect(game.board.first).to eq([empty,:x,:o])
  end

  it 'prints a visual representation of the board' do
    board      = [[:x,:x,:x], [:x, :o, :o], [:x, empty, :o]]
    game.board = board

    expected = "| X | X | X |\n| X | O | O |\n| X |   | O |"

    expect(game.to_s).to eq expected
  end

  context 'finds a winning move in' do
    it 'the horizontal direction' do
      board      = [[:x,:x,:x], [:x, :o, :o], [:x, empty, :o]]
      game.board = board

      expect(game.find_winner).to eq(:x)
    end

    it 'the vertical direction' do
      board      = [[:x,:o,:x], [:x, :o, :o], [:x, empty, :o]]
      game.board = board

      expect(game.find_winner).to eq(:x)
    end

    it 'a diagonal' do
      board      = [[:x,empty,empty], [empty, :x, empty], [empty, empty, :x]]
      game.board = board

      expect(game.find_winner).to eq(:x)
    end
  end

  it 'checks for valid moves'
  # position no already in use / filled
  # position not out of bounds
end
