defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare([], []), do: :equal

  def compare([], list), do: :sublist

  def compare(list, []), do: :superlist

  def compare([head1 | []], [head2 | []]) do
    case head1 == head2 do
      false -> :unequal
      true -> :equal
    end
  end

end
