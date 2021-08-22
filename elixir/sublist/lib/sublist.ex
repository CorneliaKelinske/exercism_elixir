defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare([], []), do: :equal

  def compare([], _list), do: :sublist

  def compare(_list, []), do: :superlist

  def compare(list_a, list_b) do
    list_a = Enum.join(list_a, "-") <> "-"
    list_b = Enum.join(list_b, "-") <>"-"

    cond do
      list_a == list_b -> :equal
      String.contains?(list_a, list_b) -> :superlist
      String.contains?(list_b, list_a) -> :sublist
      true -> :unequal
    end
  end
end
