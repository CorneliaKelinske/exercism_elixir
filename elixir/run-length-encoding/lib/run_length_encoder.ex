defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t()) :: String.t()
  def encode(""), do: ""

  def encode(string) do
    string
    |> String.graphemes()
    |> Enum.reduce([], &count_letters/2)
  end

  def count_letters(letter, []) do
    Keyword.put([], String.to_atom(letter), 1)
  end

  @spec decode(String.t()) :: String.t()
  def decode(string) do
  end
end
