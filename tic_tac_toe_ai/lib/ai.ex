defmodule AI do

  # Choose a random valid move
  def random_move(board) do
    moves = Board.valid_moves(board)
    Enum.random(moves)
  end

end
