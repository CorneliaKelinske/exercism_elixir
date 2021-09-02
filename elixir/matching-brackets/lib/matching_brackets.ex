defmodule MatchingBrackets do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @matching_brackets ["()", "[]", "{}"]

  @spec check_brackets(String.t()) :: boolean
  def check_brackets("") do
    true
  end

  def check_brackets(str) do
    str = Regex.replace(~r/[^(){}\[\]]/, str, "")
    new_str = String.replace(str, @matching_brackets, "")

    if new_str != str do
      check_brackets(new_str)
    else
      false
    end
  end
end
