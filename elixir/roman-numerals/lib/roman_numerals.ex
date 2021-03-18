defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @romans [
    {1000, "M"}, {900, "CM"}, {500, "D"},
    {400, "CD"}, {100, "C"}, {90, "XC"},
    {50, "L"}, {40, "XL"}, {10, "X"},
    {9, "IX"}, {5, "V"}, {4, "IV"}, {1, "I"}
]

  @spec numeral(pos_integer) :: String.t()
  def numeral(num, romans \\ @romans, acc \\ "")
  def numeral(0, _romans, acc), do: acc
  def numeral(num, [{int, roman} | rtail], acc) do
      numeral(rem(num, int), rtail, "#{acc}#{String.duplicate(roman, div(num, int))}")
  end

end
