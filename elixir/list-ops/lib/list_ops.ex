defmodule ListOps do
  # Please don't use any external modules (especially List or Enum) in your
  # implementation. The point of this exercise is to create these basic
  # functions yourself. You may use basic Kernel functions (like `Kernel.+/2`
  # for adding numbers), but please do not use Kernel functions for Lists like
  # `++`, `--`, `hd`, `tl`, `in`, and `length`.

  @spec count(list) :: non_neg_integer
  def count([]), do: 0

  def count([head | tail]) do
    1 + count(tail)
  end

  @spec reverse(list) :: list
  def reverse(list, acc \\ [])
  def reverse([], acc), do: acc

  def reverse([head | tail], acc) do
    reverse(tail, [head | acc])
  end

  @spec map(list, (any -> any)) :: list
  def map([], f), do: []

  def map([head | tail], f) do
    [f.(head) | map(tail, f)]
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(list, acc \\ [], f)
  def filter([], acc, f), do: reverse(acc)

  def filter([head | tail], acc, f) do
    if f.(head) == true do
      filter(tail, [head | acc], f)
    else
      filter(tail, acc, f)
    end
  end

  @type acc :: any
  @spec reduce(list, acc, (any, acc -> acc)) :: acc
  def reduce(list, acc \\ [], f)
  def reduce([], acc, f), do: acc

  def reduce([head | tail], acc, f) do
    reduce(tail, f.(head, acc), f)
  end

  @spec append(list, list) :: list
  def append([], []), do: []
  def append([], b), do: b
  def append(a, []), do: a

  def append(a, b) do
    a
    |> reverse()
    |> move_element(b)
  end

  def move_element([], b), do: b

  def move_element([head | tail], b) do
    move_element(tail, [head | b])
  end

  @spec concat([[any]]) :: [any]
  def concat([]), do: []

  def concat([head | tail]) when is_list(head) do
    concat(append(concat(head), tail))
  end

  def concat([head | tail]) do
    [head | concat(tail)]
  end
end
