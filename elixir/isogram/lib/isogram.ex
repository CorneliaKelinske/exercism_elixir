defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t()) :: boolean
  def isogram?(sentence) do
    sentence = Regex.replace(~r/[^a-zA-Z]/, sentence, "")
    length = String.length(sentence)

    processed_sentence = sentence
    |> String.graphemes()
    |> Enum.uniq()
    |> Enum.join()

    String.length(processed_sentence) == length
  end
end
