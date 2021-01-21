defmodule Jokenpo.Entries do
  @entries [:rock, :paper, :scissors]

  def all do
    @entries
  end

  def valid(entry) when entry in @entries do
    {:ok, entry }
  end

  def valid(_) do
    {:error, "Invalid entry for jokenpo"}
  end
end
