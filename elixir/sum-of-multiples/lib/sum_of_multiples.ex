defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """


  def to(limit, factors) do
    Enum.reduce(0..limit-1, 0, & &2 + get_factor_sum(&1, factors))


  end

  def get_factor_sum(number, factors) do
    Enum.map(factors, fn(x) ->
      cond do
        rem(number, x) == 0 -> number
        true -> 0
      end
    end)
    |> Enum.uniq()
    |> Enum.sum()


  end
end
