defmodule AI do

  def choose_move(board, player, difficulty) do
    case difficulty do
      :easy ->
        random_move(board)

      :medium ->
        if :rand.uniform() < 0.5 do
          random_move(board)
        else
          best_move(board, player)
        end

      :hard ->
        best_move(board, player)
    end
  end


  def random_move(board) do
    moves = Board.valid_moves(board)
    Enum.random(moves)
  end


  def best_move(board, player) do
    Board.valid_moves(board)
    |> Enum.map(fn move ->
      new_board = Board.apply_move(board, move, player)
      score = minimax(new_board, Board.next_player(player), player)

      {move, score}
    end)
    |> Enum.max_by(fn {_move, score} -> score end)
    |> elem(0)
  end


  def minimax(board, current_player, ai_player) do

    cond do

      Board.winner(board) == ai_player ->
        1

      Board.winner(board) != nil ->
        -1

      Board.valid_moves(board) == [] ->
        0

      true ->

        scores =
          Board.valid_moves(board)
          |> Enum.map(fn move ->
            new_board = Board.apply_move(board, move, current_player)

            minimax(
              new_board,
              Board.next_player(current_player),
              ai_player
            )
          end)

        if current_player == ai_player do
          Enum.max(scores)
        else
          Enum.min(scores)
        end

    end

  end

end
