defmodule Game do

  # Start a new game
  def start do
    board = Board.new_board()
    player = :x

    loop(board, player)
  end


  # Main game loop
  # This function controls the game flow.
  # It prints the board, asks for input, and continues until the game ends.
  def loop(board, player) do
    IO.puts("")
    Board.print_board(board)
    IO.puts("")

    if Board.game_over?(board) do
      end_game(board)
    else
      position = ask_move(player)

      if position in Board.valid_moves(board) do
        new_board = Board.apply_move(board, position, player)
        next_player = Board.next_player(player)

        loop(new_board, next_player)
      else
        IO.puts("Invalid move. Try again.")
        loop(board, player)
      end
    end
  end


  # Ask the player for a move
  def ask_move(player) do
    input =
      IO.gets("Player #{player}, choose a position (0-8): ")
      |> String.trim()

    {number, _} = Integer.parse(input)

    number
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
