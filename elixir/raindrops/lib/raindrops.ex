defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """

defguard is_pling(number) when rem(number, 3) == 0
defguard is_plang(number) when rem(number, 5) == 0
defguard is_plong(number) when rem(number, 7) == 0

  @spec convert(pos_integer) :: String.t()
  def convert(number) when is_pling(number) and is_plang(number) and is_plong(number) do
    "PlingPlangPlong"
  end

  def convert(number) when is_pling(number) and is_plang(number) do
    "PlingPlang"
  end

  def convert(number) when is_pling(number) and is_plong(number) do
    "PlingPlong"
  end

  def convert(number) when is_plang(number) and is_plong(number) do
    "PlangPlong"
  end

  def convert(number) when is_pling(number), do: "Pling"
  def convert(number) when is_plang(number), do: "Plang"
  def convert(number) when is_plong(number), do: "Plong"
  def convert(number), do: to_string(number)


end
