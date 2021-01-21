defmodule Jokenpo.Rules do
  alias Jokenpo.Entries

  def check_input(valor1, valor2) do
    results =
    [valor1, valor2]
    |> Enum.map(fn valor1 -> if Entries.valid(valor1) != {:ok, valor1}, do: valor1 end)
    |> Enum.reject(&is_nil/1)

    case results do
      [] -> :ok
      [value] -> {:error, "Invalid entry, there is not such value as #{value}"}
      [value1, value2] -> {:error, "Invalid entries, there is not such values as #{value1}, #{value2}"}
   end
  end

  def check_rule(:paper, :rock), do: :paper
  def check_rule(:rock, :paper), do: :paper
  def check_rule(:scissors, :rock), do: :rock
  def check_rule(:rock, :scissors), do: :rock
  def check_rule(:paper, :scissors), do: :scissors
  def check_rule(:scissors, :paper), do: :scissors
  def check_rule(value, value), do: :draw

end
