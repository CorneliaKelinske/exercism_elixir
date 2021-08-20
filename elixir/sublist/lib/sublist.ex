defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare([], []), do: :equal

  def compare([], list), do: :sublist

  def compare(list, []), do: :superlist



  def compare(listA, listB ) do
    listA = Enum.join(listA)
    listB = Enum.join(listB)

    cond do
      listA == listB -> :equal
      String.contains?(listA, listB) -> :superlist
      String.contains?(listB, listA) -> :sublist
      true -> :unequal
    end


  end
end
