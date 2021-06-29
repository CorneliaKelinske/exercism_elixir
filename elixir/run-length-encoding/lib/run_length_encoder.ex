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
    |> Enum.reverse()
    |> List.flatten()
    |> Enum.join()
  end


  def count_letters(letter, []) do
    [[letter]]
  end

  def count_letters(letter, [[letter] | tail]) do
    [[2, letter] | tail]
  end

  def count_letters(letter, [[count, letter] | tail]) do
    [[count + 1, letter] | tail]
  end

  def count_letters(letter, list) do
    [[letter] | list]
  end

  @spec decode(String.t()) :: String.t()
  def decode(""), do: ""

  def decode(string) do
    if Regex.match?(~r/[0-9]/, string) == false do
      string
    else
      process_further(string)
    end
  end

  def process_further(string) do
    Regex.split(~r/[0-9]+[a-zA-Z]/, string, include_captures: true, trim: true)
    |> Enum.map(&isolate_digits/1)
    |> Enum.reduce("", &create_string/2)
  end

  def isolate_digits(string) do
    Regex.split(~r/[0-9]+/, string, include_captures: true, trim: true)
  end

  def create_string([head | []], acc) do
    "#{acc}#{head}"
  end

  def create_string([head | tail], acc) do
    count = String.to_integer(head)
    letter = List.first(tail)
    String.duplicate(letter, count)
    "#{acc}#{String.duplicate(letter, count)}"
  end


end

#Regex.split(~r/[0-9]+/, split_string, include_captures: true, trum: true)
