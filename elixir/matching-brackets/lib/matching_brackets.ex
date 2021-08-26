defmodule MatchingBrackets do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @closing_brackets %{"(" => ")", "{" => "}", "[" => "]"}

  @spec check_brackets(String.t()) :: boolean
  def check_brackets(str) do
    str = Regex.replace(~r/[^(){}\[\]]/, str, "")
    str = String.codepoints(str)
    Enum.map(str, fn x -> List.delete(str, @closing_brackets[x]) end)
  end

end
