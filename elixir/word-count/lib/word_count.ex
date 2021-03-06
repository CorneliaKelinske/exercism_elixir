defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase()
    |> String.split(~r/[^[[:alnum:]\-öüä]+/, trim: true)
    |> Enum.reduce(%{}, &count_items/2)

  end

  def count_items(x, acc) do
    Map.update(acc, x, 1, & &1 + 1)
  end
end
