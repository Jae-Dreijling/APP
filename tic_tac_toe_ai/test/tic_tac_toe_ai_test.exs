defmodule TicTacToeAiTest do
  use ExUnit.Case
  doctest TicTacToeAi

  test "greets the world" do
    assert TicTacToeAi.hello() == :world
  end
end
