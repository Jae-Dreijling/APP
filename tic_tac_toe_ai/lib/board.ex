defmodule Board do
  @moduledoc """
  This module handles the Tic-Tac-Toe board itself.

  Board design:
  [:x, :o, :empty,
   :empty, :x, :empty,
   :o, :empty, :empty]

  Each move returns a new board. (pure functions)
  The original board stays unchanged. (immutability)
  """

  # Create a new empty board
  def new_board do
    List.duplicate(:empty, 9)
  end

  # Apply a move to the board
  # position must be between 0 and 8
  def apply_move(board, position, player) do
    List.replace_at(board, position, player)
  end

  # Return all valid moves
  def valid_moves(board) do
    board
    |> Enum.with_index()
    |> Enum.filter(fn {value, _index} -> value == :empty end)
    |> Enum.map(fn {_value, index} -> index end)
  end

  # Check if a position is free
  def valid_move?(board, position) do
    Enum.at(board, position) == :empty
  end

  # Check if the board is full
  def full?(board) do
    not Enum.any?(board, fn cell -> cell == :empty end)
  end

  # Print the board in a readable format
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

  # Convert internal symbols into printable values
  defp symbol(:x), do: "X"
  defp symbol(:o), do: "O"
  defp symbol(:empty), do: "_"
end
