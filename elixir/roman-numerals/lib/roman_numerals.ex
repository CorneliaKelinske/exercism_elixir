defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @romans [
    {1000, "M"}, {500, "D"}, {100, "C"},
    {50, "L"}, {10, "X"},{5, "V"},{1, "I"}
]


  @spec numeral(pos_integer) :: String.t()
  def numeral(num, romans \\ @romans, acc \\ "")
  def numeral(0, _romans, acc), do: acc
  def numeral(num, [{int, roman} | rtail], acc) do
      numeral(rem(num, int), rtail, "#{acc}#{String.duplicate(roman, div(num, int))}")
  end






end
