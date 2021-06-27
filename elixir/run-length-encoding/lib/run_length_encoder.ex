defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t()) :: String.t()
  def encode(string) do
    string
    |> String.graphemes()
    |> Enum.reduce([], &count_letters/2)
    |> Enum.reverse()
    |> Enum.reduce("", &create_string/2)
  end

  def create_string({letter, 1}, acc) do
    acc <> letter
  end

  def create_string({letter, count}, acc) do
    "#{acc}#{count}#{letter}"
  end


  def count_letters(letter, []) do
    [{letter, 1}]
  end

def count_letters(letter, [{letter, count}| tail]) do
  [{letter, count+1} | tail]
end

def count_letters(letter, list) do
[{letter, 1} | list]
end

  @spec decode(String.t()) :: String.t()
  def decode(string) do
  end
end
