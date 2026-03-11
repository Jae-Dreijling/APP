defmodule CLI do
  alias Board
  alias Game

  # Entry point of the program
  def start do
    difficulty = choose_difficulty()
    board = Board.new_board()
    Game.loop(board, :x, difficulty)
  end

  def choose_difficulty do
    IO.puts("Choose AI difficulty:")
    IO.puts("1 - Easy")
    IO.puts("2 - Medium")
    IO.puts("3 - Hard")

    case IO.gets("> ") |> String.trim() do
      "1" -> :easy
      "2" -> :medium
      "3" -> :hard
      _ ->
        IO.puts("Invalid choice. Try again.")
        choose_difficulty()
    end
  end
end
