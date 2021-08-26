defmodule MatchingBrackets do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @brackets %{")" => "(", "}" => "{", "]" => "["}
  @spec check_brackets(String.t()) :: boolean
  def check_brackets(str) do
    str = Regex.replace(~r/[^(){}\[\]]/, str, "")
    len = String.length(str)
    if rem(len, 2) == 0 do
      {string_A, string_B} = String.split_at(str, div(len, 2))
      string_A = String.codepoints(string_A) |> IO.inspect(label: "12", limit: :infinity, charlists: false)
      string_B
        |> String.codepoints()
        |> Enum.map(fn x -> @brackets[x] end) |> IO.inspect(label: "15", limit: :infinity, charlists: false)
      string_A == string_B

    else
      false
    end
  end
end
