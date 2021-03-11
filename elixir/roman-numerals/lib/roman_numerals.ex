defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @romans %{1 => "I"}

  @spec numeral(pos_integer) :: String.t()
  def numeral(1), do: @romans[1]
  def numeral(num, acc) when num < 4 do
    "acc<>I"

  end


end
