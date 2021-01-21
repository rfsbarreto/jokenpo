defmodule JokenpoTest do
  use ExUnit.Case
  doctest Jokenpo

  describe "run/2" do
    test "returns an error message when any of the values are invalid" do
      assert Jokenpo.run(:paper, :invalid) == "Invalid entry, there is not such value as invalid"
    end

    test "returns the winner when both values are valid and we have a winner" do
      winner = :paper
      looser = :rock
      assert Jokenpo.run(winner, looser) == "player1 wins the game with #{winner}"
      assert Jokenpo.run(looser, winner) == "player2 wins the game with #{winner}"
    end

    test "returns the winner when both values are valid and we have a draw" do
      draw = :paper
      assert Jokenpo.run(draw, draw) == "there is a draw, both players chosed #{draw}"
    end

  end
end
