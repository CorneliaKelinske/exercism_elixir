defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    Enum.reduce(0..limit, 0, fn x, acc ->
      Enum.map(factors |> IO.inspect(label: "8", limit: :infinity, charlists: false), fn factor ->
        cond do
          rem(x, factor)|> IO.inspect(label: "10", limit: :infinity, charlists: false) == 0 -> x 
          true -> 0
        end
      end)
    end)
    |> Enum.sum
  end
end
