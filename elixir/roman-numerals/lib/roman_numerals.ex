defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @romans [ {1, "I"} ]

  # 5 => "V", 10 => "X", 50 => "L",
  #100 => "C", 500 => "D", 1000 => "M"
  #}

  @spec numeral(pos_integer) :: String.t()
  def numeral(num, romans \\ @romans, acc \\ "")
  def numeral(0, _romans, acc), do: acc
  def numeral(num, [{int, roman} | rtail], acc) do
      numeral(rem(num, int), rtail, "#{acc}#{String.duplicate(roman, div(num, int))}")
  end






end
