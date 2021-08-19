defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare([], []), do: :equal

  def compare([], list), do: :sublist

  def compare(list, []), do: :superlist


  def compare(listA, listB) do
    case listA == listB do
      false -> :unequal
      true -> :equal
    end
  end

end
