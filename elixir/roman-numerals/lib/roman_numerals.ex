defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @romans %{1 => "I"}

  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    @romans[number]
  end
end
