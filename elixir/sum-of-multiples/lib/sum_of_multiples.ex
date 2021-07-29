defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  # def to(limit, factors) do
  #   Enum.reduce(0..limit, 0, fn x, acc ->
  #     Enum.map(factors, fn factor ->
  #       cond do
  #         rem(x, factor) == 0 -> x
  #         true -> 0
  #       end
  #     end)
  #   end)
  #   |> Enum.sum
  # end

  def to(limit, factors) do
    Enum.map(0..limit-1, fn(x) -> get_factor_sum(x, factors) end)
    |> Enum.sum()

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
