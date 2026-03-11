defmodule AI do
  # Public function used by the game to choose the best move for `player`.
  # Uses minimax to score each legal move, then picks the move with maximum score.
  def best_move(board, player) do
    Board.valid_moves(board)
    |> Enum.map(fn move ->
      # simulate the move
      new_board = Board.apply_move(board, move, player)
      # score recursively from new state, switching attacker to opponent
      score = minimax(new_board, Board.next_player(player), player)

      {move, score}
    end)
    # choose move with the highest minimax score (best for AI)
    |> Enum.max_by(fn {_move, score} -> score end)
    |> elem(0)
  end

  # Recursively evaluate board outcomes for minimax.
  # Returns: +1 win for ai, -1 loss for ai, 0 draw.
  def minimax(board, current_player, ai_player) do
    cond do
      # AI has won
      Board.winner(board) == ai_player ->
        1

      # somebody else (opponent) has won
      Board.winner(board) != nil ->
        -1

      # no moves left => tie
      Board.valid_moves(board) == [] ->
        0

      true ->
        # explore next moves
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

        # maximize for AI's turn, minimize for opponent's turn
        if current_player == ai_player do
          Enum.max(scores)
        else
          Enum.min(scores)
        end
    end
  end
end
