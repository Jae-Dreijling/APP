defmodule Board do

  # Create an empty board
  def new_board do
    List.duplicate(:empty, 9)
  end


  # Apply a move to the board
  # This function does not modify the original board.
  # It returns a new board with the updated value.
  def apply_move(board, position, player) do
    List.replace_at(board, position, player)
  end


  # Print the board to the console
  def print_board(board) do
    board
    |> Enum.chunk_every(3)
    |> Enum.each(fn row ->
      row
      |> Enum.map(&symbol/1)
      |> Enum.join(" | ")
      |> IO.puts()
    end)
  end


  # Convert internal values to printable symbols
  defp symbol(:empty), do: "_"
  defp symbol(:x), do: "X"
  defp symbol(:o), do: "O"

  # Return the value at a board position
  # This helper keeps board access consistent
  def get(board, position) do
    Enum.at(board, position)
  end


  # Return all positions that are still empty
  # This function scans the board and returns indexes
  # where moves are still possible
  def valid_moves(board) do
    board
    |> Enum.with_index()
    |> Enum.filter(fn {cell, _} -> cell == :empty end)
    |> Enum.map(fn {_, index} -> index end)
  end


  # All possible winning combinations
  # Instead of hardcoding many if statements we define
  # the winning patterns as data.
  def win_patterns do
    [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6]
    ]
  end


  # Check if someone won the game
  # This function iterates over all win patterns
  def winner(board) do
    Enum.find_value(win_patterns(), fn [a, b, c] ->

      v1 = get(board, a)
      v2 = get(board, b)
      v3 = get(board, c)

      if v1 != :empty and v1 == v2 and v2 == v3 do
        v1
      else
        nil
      end
    end)
  end


  # Determine if the game has ended
  # The game ends when someone wins
  # or when no valid moves remain
  def game_over?(board) do
    winner(board) != nil or valid_moves(board) == []
  end


  # Switch the active player
  def next_player(:x), do: :o
  def next_player(:o), do: :x

end
