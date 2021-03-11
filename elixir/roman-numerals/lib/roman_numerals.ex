defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @romans %{1 => "I"}

  @spec numeral(pos_integer) :: String.t()
  def numeral(num, acc \\ "")
  def numeral(0, acc), do: acc
  def numeral(num, acc) when num < 4 do
    numeral(num - 1, acc <> "I")

  end


end
