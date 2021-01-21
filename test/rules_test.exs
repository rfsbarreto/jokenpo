defmodule Jokenpo.RulesTest do
  use ExUnit.Case
  alias Jokenpo.Rules

  describe "check input/2 " do
   test "returns :ok if all input values are valid" do
    assert Rules.check_input(:paper, :rock) == :ok
   end

   test "returns {:error, invalid_input}  when one input is invalid" do
    invalid_input = :invalid_input

    assert Rules.check_input(:paper, invalid_input) == {:error, "Invalid entry, there is not such value as #{invalid_input}"}
   end

   test "returns {:error, invalid_input}  when two inputs are invalid" do
    invalid_input = :invalid_input
    invalid_input2 = :invalid_input2

    assert Rules.check_input(invalid_input, invalid_input2) == {:error, "Invalid entries, there is not such values as #{invalid_input}, #{invalid_input2}"}
   end
  end

  describe "check_rule/2" do
    test "returns winner value when the values are paper and rock" do
      assert Rules.check_rule(:paper, :rock) == :paper
      assert Rules.check_rule(:rock, :paper) == :paper
    end

    test "returns winner value when the values are paper and scissors" do
      assert Rules.check_rule(:paper, :scissors) == :scissors
      assert Rules.check_rule(:scissors, :paper) == :scissors
    end

    test "returns winner value when the values are rock and scissors" do
      assert Rules.check_rule(:rock, :scissors) == :rock
      assert Rules.check_rule(:scissors, :rock) == :rock
    end

    test "returns draw when the values are the same" do
      assert Rules.check_rule(:paper, :paper) == :draw
    end
  end
end
