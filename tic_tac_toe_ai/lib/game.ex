defmodule Game do


  # Main game loop
  # This function controls the game flow.
  # It prints the board, asks for input, and continues until the game ends.
  def loop(board, player, difficulty) do
    IO.puts("")
    Board.print_board(board)
    IO.puts("")

    if Board.game_over?(board) do
      end_game(board)
    else
      position =
        if player == :x do
          ask_move(player)
        else
          AI.choose_move(board, player, difficulty)
        end

      if position in Board.valid_moves(board) do
        new_board = Board.apply_move(board, position, player)
        next_player = Board.next_player(player)

        loop(new_board, next_player, difficulty)
      else
        IO.puts("Invalid move. Try again.")
        loop(board, player, difficulty)
      end
    end
  end


  # Ask the player for a move
  def ask_move(player) do
    input =
      IO.gets("Player #{player}, choose a position (0-8): ")
      |> String.trim()

    case Integer.parse(input) do
      {number, _} -> number
      :error ->
        IO.puts("Invalid input. Try again.")
        ask_move(player)
    end
  end


  # Handle end of game
  def end_game(board) do
    winner = Board.winner(board)

    IO.puts("")
    Board.print_board(board)
    IO.puts("")

    if winner do
      IO.puts("Player #{winner} wins!")
    else
      IO.puts("Draw!")
    end
  end

end
