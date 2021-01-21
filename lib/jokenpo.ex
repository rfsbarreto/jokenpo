defmodule Jokenpo do

  alias Jokenpo.Rules
  def run(value1, value2) do

    case Rules.check_input(value1, value2) do
      :ok ->
        case Rules.check_rule(value1, value2) do
          ^value1 -> "player1 wins the game with #{value1}"
          ^value2 -> "player2 wins the game with #{value2}"
          :draw -> "there is a draw, both players chosed #{value1}"
        end
      {:error, reason} -> reason
    end
  end
end
