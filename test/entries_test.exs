defmodule JokenpoEntriesTest do
  use ExUnit.Case
  alias Jokenpo.Entries

  describe "all/1 jokenpo entries" do
    @valid_entries [:rock, :paper, :scissors]

    test "returns all entries" do
      assert Enum.all?(Entries.all(), &(&1 in @valid_entries))
    end
  end

  describe "validate/1" do
    test "returns {:ok, value} if entry is valid" do
      assert Entries.valid(:rock) == {:ok, :rock}
    end

    test "returns {:error, reason} if entry is invalid" do
      assert Entries.valid(:banana) == {:error, "Invalid entry for jokenpo"}
    end
  end

end
